# 🌐 Синхронизация памяти между компьютерами

## 📋 Доступные варианты

---

## Вариант 1: GitHub (бесплатно, рекомендуется)

### Настройка на первом компьютере:

```bash
# 1. Создайте репозиторий на GitHub (приватный)
#    https://github.com/new (название: qwen-memory)

# 2. Инициализируйте Git
cd ~/.qwen
git init
git add QWEN.md mcp.json settings.json skills/
git commit -m "Initial memory sync"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/qwen-memory.git
git push -u origin main
```

### Использование:

```bash
# После изменений в памяти
qwen-sync

# Или вручную
~/.qwen/sync-memory.sh
```

### Настройка на втором компьютере:

```bash
# 1. Установите Qwen Code
# 2. Клонируйте репозиторий
git clone https://github.com/YOUR_USERNAME/qwen-memory.git ~/.qwen

# 3. Перезапустите Qwen Code
```

---

## Вариант 2: Supabase (облачная БД, автоматическая синхронизация)

### Преимущества:
- ✅ Автоматическая синхронизация
- ✅ Не нужно push/pull
- ✅ Работает с любого устройства сразу

### Настройка:

1. **Создайте аккаунт** на https://supabase.com (бесплатно)

2. **Создайте проект** `qwen-memory`

3. **Получите credentials:**
   - Settings → API
   - Project URL: `https://xxxxx.supabase.co`
   - Database Password: (ваш пароль)

4. **Создайте таблицы** (SQL Editor):

```sql
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

CREATE INDEX idx_observations_entity ON observations(entity_name);
```

5. **Обновите `~/.qwen/mcp.json`:**

```json
{
  "mcpServers": {
    "memory": {
      "command": "mcp-server-memory",
      "args": [],
      "env": {
        "DATABASE_URL": "postgresql://postgres:[ВАШ_ПАРОЛЬ]@db.xxxxx.supabase.co:5432/postgres"
      }
    }
  }
}
```

6. **На других компьютерах** — скопируйте тот же `mcp.json`

---

## Вариант 3: Ручной бэкап (просто, надёжно)

### Команды:

```bash
# Создать бэкап
qwen-backup

# Восстановить на другом компьютере
qwen-restore ~/Downloads/memory-backup-20260313.tar.gz
```

### Файлы:
- Бэкап сохраняется в `~/.qwen/memory-backup-YYYYMMDD.tar.gz`
- Включает: QWEN.md, mcp.json, базу данных (CSV)

---

## 🔧 Полезные команды

```bash
# Синхронизация (Git)
qwen-sync

# Экспорт памяти
qwen-backup

# Импорт памяти
qwen-restore <файл.tar.gz>

# Сохранить факт (с автообновлением)
qwen-remember "user: Предпочитает тёмную тему"

# Показать память
psql -U mac -d mcp_memory -c "SELECT * FROM entities;"
```

---

## 📊 Сравнение

| Метод | Синхронизация | Сложность | Цена |
|-------|---------------|-----------|------|
| **GitHub** | Ручная (push/pull) | Средняя | Бесплатно |
| **Supabase** | Автоматическая | Средняя | Бесплатно (500MB) |
| **Бэкап** | Ручная | Простая | Бесплатно |

---

## ✅ Рекомендация

**Для начала:** Используйте GitHub (Вариант 1)
- Быстро настраивается
- Бесплатно
- Надёжно

**Для продакшена:** Supabase (Вариант 2)
- Автоматическая синхронизация
- Профессиональное решение

---

**Файлы для синхронизации:**
- `~/.qwen/QWEN.md` — память
- `~/.qwen/mcp.json` — MCP серверы
- `~/.qwen/settings.json` — настройки
- `~/.qwen/skills/` — навыки
