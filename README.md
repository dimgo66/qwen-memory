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
- ✅ Скрипты (`*.sh`)

---

## 🔧 Использование

### После изменений в памяти:

```bash
# Быстрая синхронизация
qwen-sync

# Или вручную
cd ~/.qwen && git add . && git commit -m "Update memory" && git push
```

### На другом компьютере:

```bash
# 1. Клонируйте репозиторий
git clone https://github.com/dimgo66/qwen-memory.git ~/.qwen

# 2. Перезапустите Qwen Code
```

---

## 📊 Команды

| Команда | Описание |
|---------|----------|
| `qwen-sync` | Синхронизация с GitHub |
| `qwen-remember "факт"` | Сохранить в память |
| `qwen-backup` | Создать локальный бэкап |

---

## 🔄 Автоматизация

Добавьте в `~/.bash_profile`:

```bash
# Автосинхронизация при сохранении
alias qwen-remember='/Users/mac/.qwen/commands/remember.sh "$1" && qwen-sync'
```

---

**Проверьте репозиторий:** https://github.com/dimgo66/qwen-memory
