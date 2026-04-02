# GSD Auto-Activation Protocol

## Важно для новой сессии

**GSD — это не внешняя команда, а встроенный воркфлоу Qwen Code.**

Вам **НЕ НУЖНО** устанавливать или запускать `gsd` как CLI-утилиту.

---

## Как использовать

### Просто напишите задачу естественным языком

**Примеры:**

```
"Хочу создать сайт для конкурса фотографий"
→ Я автоматически запущу gsd:new-project
```

```
"Нужно добавить авторизацию через JWT"
→ Я автоматически запущу:
   1. gsd:requirements-spec (требования)
   2. gsd:discuss-phase --analyze (компромиссы)
   3. gsd:plan-phase (планы)
   4. gsd:execute-phase (TDD реализация)
```

```
"Проверь безопасность API"
→ Я автоматически активирую роль security-auditor
```

```
"Всё готово, можно выпускать"
→ Я автоматически запущу:
   1. gsd:verify-work (верификация)
   2. gsd:ship (code review + merge)
```

```
"Что дальше?", "Где мы?"
→ Я автоматически запущу gsd:progress
```

---

## GSD Воркфлоу (встроенные)

**Расположение:** `~/.qwen/gsd/workflows/`

| Воркфлоу | Файл |
|----------|------|
| `gsd:new-project` | workflows/new-project.md |
| `gsd:requirements-spec` | workflows/requirements-spec.md |
| `gsd:discuss-phase` | workflows/discuss-phase.md |
| `gsd:plan-phase` | workflows/plan-phase.md |
| `gsd:execute-phase` | workflows/execute-phase.md |
| `gsd:verify-work` | workflows/verify-work.md |
| `gsd:ship` | workflows/ship.md |
| `gsd:dependency-graph` | workflows/dependency-graph.md |
| `gsd:ready` | workflows/dependency-graph.md |
| `gsd:compact` | workflows/compact.md |
| `gsd:progress` | workflows/progress.md |
| `gsd:unified-workflow` | workflows/unified-workflow.md |
| `gsd:template-catalog` | workflows/template-catalog.md |
| `gsd:use-role` | workflows/template-catalog.md |
| `gsd:using-git-worktrees` | workflows/using-git-worktrees.md |

---

## Интеграции

### Superpowers
- TDD (RED-GREEN-REFACTOR)
- Code Review (обязательно перед ship)
- Requirements Spec
- Verification Before Completion

### Beads
- Dependency Graph между планами
- Ready Check (авто-определение готовых планов)
- Hash-based ID (01-01.a3f8)
- Compaction (архивация с суммаризацией)

### Template Bridge
- Unified Workflow (9 шагов)
- Template Catalog (26+ ролей)
- Git Worktrees (изоляция фич)
- Discipline Rules (золотые правила)

---

## Золотые правила (автоматически применяются)

- ❌ Нет коду без failing-теста
- ❌ Нет мерджу без review
- ❌ Нет "готово" без верификации
- ❌ Нет работы без задачи
- ✅ Evidence before claims, always

---

## Документация

- `~/.qwen/gsd/README.md` — основное руководство
- `~/.qwen/gsd/INSTRUCTION.md` — полная инструкция
- `~/.qwen/gsd/DISCIPLINE.md` — золотые правила

---

## При старте новой сессии

1. Прочитать этот файл (`~/.qwen/gsd-auto-activate.md`)
2. Если пользователь пишет задачу → автоматически определить воркфлоу
3. Не спрашивать "где установлен GSD" — он встроен в память Qwen Code
4. Выполнить воркфлоу и задокументировать прогресс
