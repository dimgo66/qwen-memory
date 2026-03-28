# Session Start Protocol

## Как загрузить память в начале сессии Qwen Code

### Проблема
Qwen Code не всегда автоматически загружает `~/.qwen/QWEN.md` в начале новой сессии.

### Решение

#### Вариант 1: Автоматическая загрузка (рекомендуется)

В начале сессии напишите:

```
Загрузи мою память из ~/.qwen/QWEN.md
```

Или:

```
Прочитай ~/.qwen/QWEN.md и примени все настройки
```

---

#### Вариант 2: Команда в терминале

```bash
# macOS/Linux
~/.qwen/commands/load-qwen-memory.sh

# Или
cat ~/.qwen/QWEN.md | pbcopy  # Копировать в буфер
# Затем вставьте в чат Qwen Code
```

---

#### Вариант 3: Быстрая команда

Напишите в чат:

```
/session-start
```

Это триггер для загрузки контекста.

---

## Что загружается

При загрузке памяти Qwen Code применяет:

### 🔌 MCP Серверы
- postgres-memory (localhost:3001)
- filesystem (/Users/mac)
- git
- puppeteer, playwright
- context7, pdf
- github (с GITHUB_TOKEN)

### 📁 Проекты
- Mister Kamysh (React + FastAPI)
- Агачер Конкурс (konkurs-minmv)

### 🚀 GSD Настройки
- 17 воркфлоу файлов
- 40+ команд
- Авто-распознавание задач
- MCP/Skills авто-подключение

### 📋 Протоколы
- TDD Workflow
- Docker Debug Checklist
- Multi-Agent Protocol
- File Editing Protocol
- GitHub Sync

### 🎨 Рабочие правила
- Non-Latin шрифты (Playfair Display)
- CSS Caching (hard refresh)
- Цвета (#666945, #fffcbb)
- Docker/Deployment проверки

---

## Проверка загрузки

После загрузки спросите:

```
Что ты помнишь о моих проектах?
```

**Ожидаемый ответ:**
- Mister Kamysh: React + FastAPI, ports 8000/3000
- Агачер Конкурс: konkurs-minmv
- GSD установлен в ~/.qwen/gsd/
- MCP сервера подключены

---

## Скрипт для автоматизации

Создайте `~/.qwen/pre-session.sh`:

```bash
#!/bin/bash
# Pre-session setup for Qwen Code

echo "Loading Qwen Code context..."
cat ~/.qwen/QWEN.md | pbcopy
echo "✓ Context copied to clipboard"
echo "Paste into Qwen Code chat"
```

Сделайте исполняемым:
```bash
chmod +x ~/.qwen/pre-session.sh
```

---

## Быстрый старт

1. Откройте Qwen Code
2. Напишите: **"Загрузи ~/.qwen/QWEN.md"**
3. Дождитесь подтверждения
4. Начните работу с GSD командами

---

**Версия:** 1.0  
**Обновлено:** 28 марта 2026
