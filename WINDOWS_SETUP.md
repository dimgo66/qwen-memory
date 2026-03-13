# Qwen Memory на Windows

## 📋 Установка

### 1. Установите Git for Windows
https://git-scm.com/download/win

### 2. Установите PostgreSQL
https://www.postgresql.org/download/windows/

### 3. Клонируйте репозиторий

Откройте **Git Bash** и выполните:

```bash
git clone https://github.com/dimgo66/qwen-memory.git ~/.qwen
```

Или в PowerShell:
```powershell
git clone https://github.com/dimgo66/qwen-memory.git $HOME\.qwen
```

---

## 🔧 Настройка

### 1. Обновите пользователя PostgreSQL

Откройте `~/.qwen/commands/remember.sh` и замените:
```bash
psql -U mac -d mcp_memory
```

На вашего пользователя Windows (обычно `postgres`):
```bash
psql -U postgres -d mcp_memory
```

### 2. Создайте базу данных

```bash
psql -U postgres -c "CREATE DATABASE mcp_memory;"
```

### 3. Создайте таблицы

```bash
psql -U postgres -d mcp_memory -c "
CREATE TABLE entities (
    name TEXT PRIMARY KEY,
    entity_type TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    entity_name TEXT REFERENCES entities(name) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE relations (
    id SERIAL PRIMARY KEY,
    from_entity TEXT REFERENCES entities(name),
    to_entity TEXT REFERENCES entities(name),
    relation_type TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
"
```

---

## 🚀 Использование

### В Git Bash:

```bash
# Сохранить в память
~/.qwen/commands/remember.sh "user: факт"

# Синхронизировать
~/.qwen/sync-memory.sh

# Или вручную
cd ~/.qwen
git add .
git commit -m "Update"
git push
```

### В PowerShell:

```powershell
# Сохранить
bash ~/.qwen/commands/remember.sh "user: факт"

# Синхронизировать
bash ~/.qwen/sync-memory.sh
```

---

## ⚡ PowerShell скрипты (альтернатива)

Создайте `~/.qwen/commands/remember.ps1`:

```powershell
param($fact)

if (-not $fact) {
    Write-Host "❌ Использование: remember.ps1 '<факт>'"
    exit 1
}

# Сохранение в БД
psql -U postgres -d mcp_memory -c "INSERT INTO observations (entity_name, content) VALUES ('user', '$fact');"

# Обновление QWEN.md
& bash ~/.qwen/update-qwen-md.sh

# Синхронизация
Set-Location ~/.qwen
git add QWEN.md
git commit -m "Memory update: $fact"
git push

Write-Host "✅ Сохранено и синхронизировано!"
```

---

## 🔄 Синхронизация между macOS и Windows

**Работает одинаково!**

1. На macOS: `/remember "факт"` → автопуш на GitHub
2. На Windows: `git pull` → память обновлена

Или наоборот:
1. На Windows: сохранение → пуш
2. На macOS: `git pull` → память обновлена

---

## 📊 Сравнение платформ

| Действие | macOS/Linux | Windows |
|----------|-------------|---------|
| Клонирование | `git clone` | `git clone` (Git Bash) |
| Сохранение | `/remember` | `bash remember.sh` |
| Синхронизация | `qwen-sync` | `bash sync-memory.sh` |
| PowerShell | - | `remember.ps1` |

---

## ✅ Итог

**GitHub синхронизация работает на всех платформах!** 🎉

Разница только в том, как запускать скрипты:
- **macOS/Linux:** Напрямую в терминале
- **Windows:** Через Git Bash или PowerShell
