# State Template

Шаблон для `.planning/STATE.md` — живая память проекта.

<template>

```markdown
# Project State

## Project Reference

См: .planning/PROJECT.md (обновлено [дата])

**Core value:** [Одно-строчник из PROJECT.md Core Value]
**Current focus:** [Текущая фаза name]

## Current Position

Phase: [X] из [Y] ([Phase name])
Plan: [A] из [B] в текущей фазе
Status: [Ready to plan / Planning / Ready to execute / In progress / Phase complete]
Last activity: [YYYY-MM-DD] — [Что произошло]

Progress: [░░░░░░░░░░] 0%

## Performance Metrics

**Velocity:**
- Total plans completed: [N]
- Average duration: [X] min
- Total execution time: [X.X] hours

**By Phase:**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| - | - | - | - |

**Recent Trend:**
- Last 5 plans: [длительности]
- Trend: [Improving / Stable / Degrading]

*Обновляется после завершения каждого плана*

## Accumulated Context

### Decisions

Решения логируются в PROJECT.md Key Decisions table.
Последние решения, влияющие на текущую работу:

- [Phase X]: [Решение summary]
- [Phase Y]: [Решение summary]

### Pending Todos

[Из .planning/todos/pending/ — идеи, захваченные во время сессий]

Пока нет.

### Blockers/Concerns

[Проблемы, влияющие на будущую работу]

Пока нет.

## Session Continuity

Last session: [YYYY-MM-DD HH:MM]
Stopped at: [Описание последнего завершённого действия]
Resume file: [Путь к .continue-here*.md если существует, иначе "None"]
```

</template>

<purpose>

STATE.md — краткосрочная память проекта, охватывающая все фазы и сессии.

**Проблема:** Информация захватывается в summaries, issues и decisions, но не систематически потребляется. Сессии начинаются без контекста.

**Решение:** Один маленький файл, который:
- Читается первым в каждом воркфлоу
- Обновляется после каждого значимого действия
- Содержит дайджест накопленного контекста
- Позволяет мгновенное восстановление сессии

</purpose>

<lifecycle>

**Создание:** После создания ROADMAP.md (во время init)
- Прочитать PROJECT.md для текущего контекста
- Инициализировать пустые секции accumulated context
- Установить позицию в "Phase 1 ready to plan"

**Чтение:** Первый шаг каждого воркфлоу
- progress: Представить статус пользователю
- plan: Информировать решения планирования
- execute: Знать текущую позицию

**Обновление:** После каждого значимого действия
- Завершение плана: обновить прогресс, метрики
- Блокер: добавить в Blockers/Concerns
- Решение: добавить в Decisions
- Конец сессии: обновить Session Continuity

</lifecycle>
