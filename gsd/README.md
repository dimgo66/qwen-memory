# GSD для Qwen Code

Адаптированная версия Get Shit Done v1.29.0 для Qwen Code.

## Автоматическое подключение MCP/Skills

**MCP серверы** и **Skills** подключаются автоматически — вам не нужно указывать их вручную!

| MCP | Когда используется |
|-----|-------------------|
| `filesystem` | Всегда (анализ файлов) |
| `git` | Коммиты, ship, review |
| `memory` | Сохранение контекста |
| `postgres` | Работа с БД проекта |
| `puppeteer` | UI тестирование |

| Skills | Когда используется |
|--------|-------------------|
| `anthropic-frontend-design` | UI задачи |
| `web-design-guidelines` | UI review, аудит |
| `vercel-react-best-practices` | React код |
| `review` | Code review |

---

## Как использовать

Поскольку Qwen Code не поддерживает систему команд как Claude Code, используйте **ручные команды** — пишите их текстом в чат.

## Быстрый старт

```
gsd:new-project         # Начать новый проект
gsd:map-codebase        # Анализ существующего проекта
gsd:progress            # Где мы сейчас?
gsd:next                # Что дальше?
gsd:help                # Все команды
```

## Основные команды

### Core Workflow

| Команда | Описание |
|---------|----------|
| `gsd:new-project` | Инициализация: вопросы → research → требования → roadmap |
| `gsd:map-codebase` | Анализ существующего проекта |
| `gsd:discuss-phase [N]` | Обсуждение деталей фазы N |
| `gsd:discuss-phase [N] --auto` | Автоматический анализ |
| `gsd:discuss-phase [N] --analyze` | Анализ компромиссов |
| `gsd:plan-phase [N]` | Планирование фазы N |
| `gsd:execute-phase [N]` | Выполнение планов |
| `gsd:verify-work [N]` | UAT проверка |
| `gsd:ship [N]` | Завершение и публикация |
| `gsd:next` | Авто-переход к следующему |

### UI Команды

| Команда | Описание |
|---------|----------|
| `gsd:ui-phase [N]` | UI спецификация для фазы N |
| `gsd:ui-phase [N] --detailed` | Расширенная UI спецификация |
| `gsd:ui-review [N]` | Визуальный аудит по 6 направлениям |
| `gsd:ui-review [N] --strict` | Строгий режим (WCAG AAA) |

### Навигация

| Команда | Описание |
|---------|----------|
| `gsd:progress` | Текущий статус |
| `gsd:next` | Следующий шаг |
| `gsd:manager` | Командный центр |
| `gsd:manager --interactive` | Интерактивный режим |
| `gsd:help` | Справка |

## Пример сессии

```
Вы: gsd:new-project
→ Инициализация проекта

Вы: gsd:discuss-phase 1 --analyze
→ Анализ компромиссов

Вы: gsd:plan-phase 1
→ Детальное планирование

Вы: gsd:ui-phase 1
→ UI спецификация

Вы: gsd:execute-phase 1
→ Выполнение

Вы: gsd:ui-review 1
→ Визуальный аудит

Вы: gsd:verify-work
→ UAT

Вы: gsd:ship
→ Публикация

Вы: gsd:next
→ Переход к Phase 2
```

## Структура проекта

```
.planning/
├── PROJECT.md          # Контекст проекта
├── REQUIREMENTS.md     # Требования
├── ROADMAP.md          # Дорожная карта
├── STATE.md            # Текущее состояние
├── config.json         # Настройки
├── ui-specs/           # UI спецификации
│   └── phase-N-UI-SPEC.md
└── audits/             # Аудиты
    └── ui-review-phase-N.md
```

## Структура GSD

```
~/.qwen/gsd/
├── README.md           # Этот файл
├── INSTRUCTION.md      # Полная инструкция
├── config.json         # Конфигурация
├── workflows/          # Воркфлоу
│   ├── new-project.md
│   ├── map-codebase.md
│   ├── discuss-phase.md
│   ├── plan-phase.md
│   ├── execute-phase.md
│   ├── verify-work.md
│   ├── ship.md
│   ├── next.md
│   ├── progress.md
│   ├── ui-phase.md
│   ├── ui-review.md
│   ├── manager.md
│   └── help.md
└── templates/          # Шаблоны
    ├── project.md
    ├── requirements.md
    ├── roadmap.md
    └── state.md
```

## Версия

GSD 1.29.0 (адаптировано для Qwen Code)

## Поддержка

- Документация: https://github.com/gsd-build/get-shit-done
- Discord: https://discord.gg/gsd
