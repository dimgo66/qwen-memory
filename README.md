# ✅ Синхронизация настроена!

## 🎉 Готово!

Ваша память Qwen Code теперь синхронизируется с GitHub:

**Репозиторий:** https://github.com/dimgo66/qwen-memory

---

## 📁 Что синхронизируется:

- ✅ `QWEN.md` — память пользователя
- ✅ `mcp.json` — MCP серверы
- ✅ `settings.json` — настройки
- ✅ `skills/` — навыки (28 файлов)
- ✅ Скрипты для macOS/Linux и Windows

---

## 🖥️ Платформы

### macOS / Linux

```bash
# Сохранить в память (с автосинхронизацией)
/remember "факт"

# Или через терминал
qwen-remember "факт"

# Синхронизировать вручную
qwen-sync
```

### Windows

**Требуется:** [Git for Windows](https://git-scm.com/download/win) + [PostgreSQL](https://www.postgresql.org/download/windows/)

```powershell
# В PowerShell (с автосинхронизацией)
.\remember.ps1 "факт"

# В Git Bash
~/.qwen/commands/remember.sh "факт"

# Синхронизировать вручную
.\sync-memory.ps1
```

📚 **Подробная инструкция:** см. [WINDOWS_SETUP.md](WINDOWS_SETUP.md)

---

## 🔧 Использование

### После изменений в памяти:

```bash
# Обычно не нужно — автосинхронизация работает
# Но если нужно вручную:
qwen-sync

# Или
cd ~/.qwen && git add . && git commit -m "Update" && git push
```

### На другом компьютере:

```bash
# 1. Клонируйте репозиторий
git clone https://github.com/dimgo66/qwen-memory.git ~/.qwen

# 2. Перезапустите Qwen Code
```

---

## 📊 Команды

| Платформа | Команда | Описание |
|-----------|---------|----------|
| **macOS/Linux** | `qwen-remember "факт"` | Сохранить в память |
| **Windows** | `.\remember.ps1 "факт"` | Сохранить в память |
| **Все** | `qwen-sync` / `.\sync-memory.ps1` | Синхронизация |

---

## 🔄 Автоматизация

**При использовании `/remember` или `qwen-remember`:**
- ✅ Сохранение в PostgreSQL
- ✅ Обновление QWEN.md
- ✅ Git коммит и пуш на GitHub

**Всё автоматически!**

---

**Проверьте репозиторий:** https://github.com/dimgo66/qwen-memory
