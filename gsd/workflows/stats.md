# gsd:stats

Статистика проекта — фазы, планы, требования, git метрики.

## Что делает

1. Считает метрики проекта
2. Анализирует прогресс по фазам
3. Вычисляет velocity
4. Показывает git статистику
5. Прогнозирует завершение

## Как использовать

```
gsd:stats
gsd:stats --json
gsd:stats --verbose
```

## Процесс

### Шаг 1: Сбор данных

**Из ROADMAP.md:**
- Количество фаз
- Количество планов в каждой фазе
- Выполненные планы
- Прогресс по фазам

**Из STATE.md:**
- Текущая фаза
- Текущий план
- Метрики velocity

**Из PROJECT.md:**
- Количество требований
- Статус требований (Validated, Active, Out of Scope)

**Из git:**
- Количество коммитов
- Дата начала проекта
- Активность по дням

### Шаг 2: Вычисление метрик

```markdown
## Project Statistics

### Overview

**Project:** [Name]
**Started:** YYYY-MM-DD
**Days active:** N
**Status:** In Progress

### Phases

| Phase | Name | Plans | Complete | Progress |
|-------|------|-------|----------|----------|
| 1 | Setup | 5 | 5/5 | 100% ✓ |
| 2 | Auth | 8 | 6/8 | 75% ▶ |
| 3 | Dashboard | 6 | 0/6 | 0% |
| 4 | Reports | 4 | 0/6 | 0% |

**Total:** 23 плана
**Completed:** 11/23 (48%)

### Requirements

| Status | Count | Percentage |
|--------|-------|------------|
| Validated | 5 | 25% |
| Active | 12 | 60% |
| Out of Scope | 3 | 15% |

**Total:** 20 требований

### Velocity

**Average:** 2.3 плана/день
**Total time:** 48 часов
**Average per plan:** 45 мин

**By Phase:**

| Phase | Plans | Total Time | Avg/Plan |
|-------|-------|------------|----------|
| 1 | 5 | 3h 20m | 40 min |
| 2 | 6 | 4h 30m | 45 min |

**Trend:**
- Week 1: 5 планов
- Week 2: 8 планов
- Week 3: 6 планов
- **Trend:** ↑ Improving

### Git Metrics

**Commits:** 47
**Branches:** 3
**Last commit:** 2 hours ago

**Commit frequency:**
- Today: 3 коммита
- This week: 12 коммитов
- This month: 35 коммитов

**Top files:**
1. `src/components/UserForm.vue` — 8 коммитов
2. `src/stores/auth.js` — 6 коммитов
3. `src/api/auth.js` — 5 коммитов

### Predictions

**Phase 2 ETA:** 2 дня
**Phase 3 ETA:** 3 дня
**Project ETA:** 8 дней

**Confidence:** 75%
```

### Шаг 3: Визуализация

```
## Progress Visualization

Overall: [████████░░░░░░░░░░] 48%

Phase 1: [████████████████████] 100% ✓
Phase 2: [██████████████░░░░░░]  75% ▶
Phase 3: [░░░░░░░░░░░░░░░░░░░░]   0%
Phase 4: [░░░░░░░░░░░░░░░░░░░░]   0%

Requirements:
  Validated:    [████░░░░░░] 25%
  Active:       [██████████░] 60%
  Out of Scope: [██░░░░░░░░] 15%
```

### Шаг 4: Вывод

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Project Statistics
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Project:** [Name]
**Status:** In Progress — Day 14

## Progress

**Overall:** [████████░░░░░░░░░░] 48%
**Phases:** 1/4 complete
**Plans:** 11/23 complete

## Velocity

**Average:** 2.3 плана/день
**Trend:** ↑ Improving

## Git

**Commits:** 47
**Last commit:** 2 hours ago

## Predictions

**Phase 2 complete:** 2 дня
**Project complete:** 8 дней
**Confidence:** 75%
```

## Флаги

| Флаг | Описание |
|------|----------|
| `--json` | Экспорт в JSON формате |
| `--verbose` | Подробная статистика со всеми метриками |
| `--brief` | Только ключевые метрики |

## JSON вывод (--json)

```json
{
  "project": {
    "name": "Project Name",
    "started": "2026-03-13",
    "days_active": 14,
    "status": "In Progress"
  },
  "phases": {
    "total": 4,
    "complete": 1,
    "plans": {
      "total": 23,
      "completed": 11,
      "progress": 0.48
    }
  },
  "requirements": {
    "validated": 5,
    "active": 12,
    "out_of_scope": 3,
    "total": 20
  },
  "velocity": {
    "plans_per_day": 2.3,
    "total_hours": 48,
    "avg_per_plan_min": 45,
    "trend": "improving"
  },
  "git": {
    "commits": 47,
    "branches": 3,
    "last_commit": "2026-03-27T10:30:00Z"
  },
  "predictions": {
    "phase_eta_days": 2,
    "project_eta_days": 8,
    "confidence": 0.75
  }
}
```

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Регулярный статус | `gsd:stats` |
| Отчёт для команды | `gsd:stats --verbose` |
| Экспорт для инструментов | `gsd:stats --json` |
| Быстрый статус | `gsd:progress` |

## Примеры

```
gsd:stats                    # Базовая статистика
gsd:stats --json             # JSON для парсинга
gsd:stats --verbose          # Подробный отчёт
```
