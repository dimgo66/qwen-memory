# gsd:manager

Интерактивный командный центр для управления несколькими фазами.

## Что делает

1. Показывает общую картину проекта
2. Предлагает интерактивное управление
3. Позволяет переключаться между фазами
4. Управляет workstreams (параллельная работа)

## Как использовать

```
gsd:manager
gsd:manager --interactive
gsd:manager --overview
```

## Режимы

### Режим 1: Overview

```
gsd:manager --overview

## Project Dashboard

**Project:** [Name]
**Status:** In Progress
**Started:** YYYY-MM-DD
**Days active:** N

## Phase Overview

| Phase | Name | Status | Plans | Complete | Progress |
|-------|------|--------|-------|----------|----------|
| 1 | [Name] | ✓ Shipped | 5 | 5/5 | ████████ 100% |
| 2 | [Name] | ▶ In Progress | 8 | 3/8 | ███░░░░░ 37% |
| 3 | [Name] | ⏸ Pending | 6 | 0/6 | ░░░░░░░░ 0% |
| 4 | [Name] | ⏸ Pending | 4 | 0/4 | ░░░░░░░░ 0% |

**Overall Progress:** [████░░░░░░] 35%

## Current Focus

**Active Phase:** Phase 2 — [Name]
**Current Plan:** 02-04 — [Description]
**Last Activity:** 2 hours ago

## Metrics

- **Velocity:** 2.3 plans/day
- **ETA Phase 2:** 2 days
- **ETA Project:** 8 days

## Quick Actions

1. Continue Phase 2 (gsd:execute-phase 2)
2. View Phase 2 details (gsd:progress 2)
3. Plan Phase 3 (gsd:plan-phase 3)
4. Run UAT on Phase 1 (gsd:verify-work 1)
```

### Режим 2: Interactive

```
gsd:manager --interactive

## Command Center

Выберите действие:

[1] Продолжить текущую фазу
[2] Переключиться на другую фазу
[3] Создать новую фазу
[4] Управление workstreams
[5] Просмотр метрик
[6] Экспорт отчёта
[7] Настройки проекта

Ваш выбор: _
```

#### Опция 1: Продолжить текущую фазу

```
> Продолжаю Phase 2

**Current Plan:** 02-04 — [Description]
**Status:** In progress

Начинаю gsd:execute-phase 2...
```

#### Опция 2: Переключиться на фазу

```
> Переключиться на фазу

Доступные фазы:
[1] Phase 1 — ✓ Shipped
[2] Phase 2 — ▶ In Progress (current)
[3] Phase 3 — ⏸ Pending
[4] Phase 4 — ⏸ Pending

Выберите фазу: 3

> Переключаюсь на Phase 3

**Phase 3:** [Name]
**Status:** Ready to plan
**Plans:** 6 (not planned yet)

Следующий шаг: gsd:plan-phase 3?
```

#### Опция 3: Создать новую фазу

```
> Создать новую фазу

**Последняя фаза:** Phase 4 — [Name]

Введите название новой фазы:
> Phase 5: Analytics Dashboard

**Goal:** [Что доставляет эта фаза]
**Requirements:** [REQ-XX, REQ-YY]

Создаю Phase 5 в ROADMAP.md...
```

#### Опция 4: Workstreams

```
> Управление workstreams

Workstreams позволяют работать над несколькими фазами параллельно.

Текущие workstreams:
- main (active) — Phase 2
- feature/auth — Phase 3

[1] Создать workstream
[2] Переключить workstream
[3] Merge workstream
[4] Список workstreams

Ваш выбор: _
```

#### Опция 5: Метрики

```
> Просмотр метрик

## Performance Metrics

**Velocity:**
- Total plans completed: 8
- Average duration: 45 min
- Total execution time: 6 hours

**By Phase:**

| Phase | Plans | Total Time | Avg/Plan |
|-------|-------|------------|----------|
| 1 | 5 | 3h 20m | 40 min |
| 2 | 3 | 2h 15m | 45 min |

**Trend:**
- Week 1: 5 plans
- Week 2: 8 plans
- Trend: ↑ Improving

**Predictions:**
- Phase 2 ETA: 2 days
- Project ETA: 8 days
```

#### Опция 6: Экспорт отчёта

```
> Экспорт отчёта

Формат отчёта:
[1] Markdown (.md)
[2] JSON
[3] CSV (для таблиц)
[4] Slack format

Выберите формат: 1

Экспортирую в .planning/reports/project-report-YYYY-MM-DD.md...

**Отчёт включает:**
- Progress summary
- Phase details
- Metrics
- Risks and blockers
- Next steps
```

## Процесс

### Шаг 1: Сбор данных

- Читаю ROADMAP.md — все фазы и планы
- Читаю STATE.md — текущая позиция
- Читаю PROJECT.md — контекст
- Считаю метрики из истории

### Шаг 2: Генерация dashboard

```markdown
## Dashboard

[Визуальная картина проекта]

## Quick Actions

[Контекстные следующие шаги]

## Alerts

[Проблемы требующие внимания]
```

### Шаг 3: Интерактивное меню

```
Выберите действие:

[1-6] Действия
[q] Выход

Ваш выбор: _
```

## Вывод

```
## gsd:manager

**Dashboard открыт**

Project: [Name]
Progress: [████░░░░░░] 35%
Active: Phase 2 — Plan 02-04

**Quick action:** gsd:execute-phase 2

[Интерактивное меню доступно]
```

## Флаги

| Флаг | Описание |
|------|----------|
| `--interactive` | Интерактивный режим с меню |
| `--overview` | Только overview без меню |
| `--json` | Экспорт в JSON формате |
| `--watch` | Авто-обновление dashboard (real-time) |

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Общая картина проекта | `gsd:manager --overview` |
| Интерактивное управление | `gsd:manager --interactive` |
| Быстрый статус | `gsd:progress` |
| Экспорт для стейкхолдеров | `gsd:manager --json` |
