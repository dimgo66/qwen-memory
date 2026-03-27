# gsd:next

Автоматическое определение состояния и переход к следующему шагу.

## Что делает

1. Анализирует текущее состояние проекта
2. Определяет где остановились
3. Автоматически переходит к следующему шагу
4. Обновляет STATE.md

## Как использовать

```
gsd:next
```

## Логика определения состояния

### Диаграмма состояний

```
new-project → discuss-phase → plan-phase → execute-phase → verify-work → ship → next phase
      ↑                                                                                            ↓
      └────────────────────────────────────────────────────────────────────────────────────────────┘
```

### Алгоритм

```
1. Читаю STATE.md
2. Определяю текущий статус:
   
   IF Phase не создана:
      → Предлагаю: gsd:new-project
   
   IF Phase создана, планов нет:
      → Предлагаю: gsd:discuss-phase N или gsd:plan-phase N
   
   IF Планы есть, не выполнены:
      → Предлагаю: gsd:execute-phase N
   
   IF Планы выполнены, UAT не пройден:
      → Предлагаю: gsd:verify-work
   
   IF UAT пройден, не shipped:
      → Предлагаю: gsd:ship
   
   IF Phase shipped, есть следующие:
      → Предлагаю: gsd:plan-phase N+1
   
   IF Все фазы завершены:
      → Предлагаю: gsd:new-milestone или завершение проекта
```

## Процесс

### Шаг 1: Чтение состояния

```markdown
# Из STATE.md

Phase: 1 из 4 (Phase 1 name)
Plan: 2 из 3
Status: In progress
```

### Шаг 2: Анализ

```
IF Status == "In progress":
   → Продолжить execute-phase
   
IF Status == "Phase complete":
   → Перейти к verify-work
   
IF Status == "Ready to plan":
   → Запустить plan-phase
```

### Шаг 3: Действие

**Вариант A: Автоматическое выполнение**

```
gsd:next

→ Автоматически запускаю следующий шаг:
  "Обнаружил: Phase 1, Plan 2/3 выполнен. 
   Следующий шаг: Plan 01-03.
   Начинаю выполнение..."
```

**Вариант B: Предложение**

```
gsd:next

→ Предлагаю следующий шаг:
  "Текущее состояние:
   Phase 1: 2/3 планов выполнено
   
   Следующий шаг: gsd:execute-phase 1 (Plan 01-03)
   
   Выполнить? (Y/n)"
```

## Сценарии

### Сценарий 1:新项目

```
STATE: Нет .planning/

gsd:next
→ "Проект не инициализирован. Начать с gsd:new-project?"
```

### Сценарий 2: После планирования

```
STATE: Phase 1, Status "Ready to execute", Plans 3

gsd:next
→ "Планирование завершено. Начинаю gsd:execute-phase 1?"
```

### Сценарий 3: Середина выполнения

```
STATE: Phase 1, Plan 2/3, Status "In progress"

gsd:next
→ "Продолжаю с Plan 01-03..."
```

### Сценарий 4: Фаза завершена

```
STATE: Phase 1, Status "Phase complete"

gsd:next
→ "Phase 1 завершена. Запускаю gsd:verify-work?"
```

### Сценарий 5: UAT пройден

```
STATE: Phase 1, UAT "PASS"

gsd:next
→ "UAT пройден. Запускаю gsd:ship?"
```

### Сценарий 6: Phase shipped

```
STATE: Phase 1 "shipped", Phase 2 "not started"

gsd:next
→ "Phase 1 shipped. Начинаю gsd:plan-phase 2?"
```

## Вывод

```
## gsd:next

**Текущее состояние:**
Phase 1: Plan 2/3 выполнен
Status: In progress

**Следующий шаг:**
→ gsd:execute-phase 1 (Plan 01-03)

Начинаю выполнение...
```

## Флаги

| Флаг | Описание |
|------|----------|
| `--auto` | Автоматическое выполнение без подтверждения |
| `--dry-run` | Показать что будет сделано, не выполнять |

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Не уверены что дальше | `gsd:next` |
| Хотите продолжить без раздумий | `gsd:next --auto` |
| Проверить перед выполнением | `gsd:next --dry-run` |
