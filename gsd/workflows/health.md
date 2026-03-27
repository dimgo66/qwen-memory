# gsd:health

Валидация директории `.planning/` и отчёт о проблемах.

## Что делает

1. Проверяет целостность `.planning/`
2. Находит отсутствующие файлы
3. Выявляет несоответствия состояния
4. Предлагает исправления
5. Опционально автоматически исправляет

## Как использовать

```
gsd:health
gsd:health --repair
```

## Процесс

### Шаг 1: Парсинг аргументов

```
Если аргументы содержат "--repair":
  $REPAIR_FLAG = "--repair"
```

### Шаг 2: Запуск проверки

Проверяет:

**Файлы:**
- [ ] PROJECT.md существует
- [ ] REQUIREMENTS.md существует
- [ ] ROADMAP.md существует
- [ ] STATE.md существует
- [ ] config.json существует и валиден

**Конфигурация:**
- [ ] config.json — валидный JSON
- [ ] required поля присутствуют
- [ ] значения корректны

**Состояние:**
- [ ] STATE.md соответствует ROADMAP.md
- [ ] Фазы в ROADMAP.md существуют
- [ ] Планы соответствуют фазам

**Целостность:**
- [ ] Нет orphaned планов
- [ ] Нумерация фаз корректна
- [ ] Нет дубликатов

### Шаг 3: Форматирование вывода

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Health Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Status: HEALTHY | DEGRADED | BROKEN
Errors: N | Warnings: N | Info: N
```

### Шаг 4: Отчёт о проблемах

#### Errors (критические)

```
## Errors

- [E001] config.json: JSON parse error at line 5
  Fix: Run gsd:health --repair to reset to defaults

- [E002] PROJECT.md not found
  Fix: Run gsd:new-project to create

- [E003] ROADMAP.md has no phases defined
  Fix: Run gsd:new-project or gsd:add-phase

- [E004] STATE.md references phase 5, but ROADMAP.md has only 3 phases
  Fix: Review STATE.md or run gsd:health --repair
```

#### Warnings (некритические)

```
## Warnings

- [W001] REQUIREMENTS.md missing traceability matrix
  Fix: Add traceability matrix manually

- [W002] STATE.md references phase 5, but only phases 1-3 exist
  Fix: Review STATE.md manually before changing it

- [W003] Phase directory "1-setup" doesn't follow NN-name format
  Fix: Rename to match pattern (e.g., 01-setup)

- [W004] config.json missing optional field "workflow.research"
  Fix: Add field or run gsd:health --repair
```

#### Info (информационные)

```
## Info

- [I001] 02-implementation/02-01-PLAN.md has no SUMMARY.md
  Note: May be in progress

- [I002] Last STATE.md update was 5 days ago
  Note: Consider updating after recent work

- [I003] Phase 3 has no plans yet
  Note: Run gsd:plan-phase 3 when ready
```

### Шаг 5: Исправления (если --repair)

```
## Repairs Performed

✓ config.json: Created with defaults
✓ STATE.md: Regenerated from ROADMAP.md
✓ Missing directories created: .planning/research/, .planning/todos/
✓ Fixed phase numbering: "1-setup" → "01-setup"
```

### Шаг 6: Предложение исправления

**Если есть исправляемые проблемы и --repair НЕ использован:**

```
---
N issues can be auto-repaired. Run: gsd:health --repair

Исправить автоматически? (Y/n)
```

**Если пользователь подтверждает:**

```
Запускаю gsd:health --repair...

[Выполнение исправлений]

✓ Исправлено N проблем
```

## Статусы

| Статус | Описание |
|--------|----------|
| **HEALTHY** | Нет ошибок, нет предупреждений |
| **DEGRADED** | Есть предупреждения, но проект функционален |
| **BROKEN** | Есть критические ошибки, проект не функционален |

## Коды ошибок

| Код | Описание | Исправление |
|-----|----------|-------------|
| E001 | config.json не валиден | `gsd:health --repair` |
| E002 | PROJECT.md отсутствует | `gsd:new-project` |
| E003 | ROADMAP.md пуст | `gsd:new-project` или `gsd:add-phase` |
| E004 | STATE.md не соответствует ROADMAP | `gsd:health --repair` |
| E005 | Отсутствует .planning/ директория | `gsd:new-project` |

## Коды предупреждений

| Код | Описание | Исправление |
|-----|----------|-------------|
| W001 | Отсутствует traceability matrix | Вручную добавить |
| W002 | STATE.md ссылается на несуществующую фазу | Review вручную |
| W003 | Неправильный формат имени фазы | Переименовать |
| W004 | Отсутствуют опциональные поля config | `gsd:health --repair` |
| W005 | Orphaned планы | Удалить или переместить |

## Примеры вывода

### Healthy

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Health Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Status: HEALTHY ✓
Errors: 0 | Warnings: 0 | Info: 2

## Info

- [I001] Phase 3 has no plans yet
  Note: Run gsd:plan-phase 3 when ready

- [I002] Last update: 2 hours ago

---
Project is healthy!
```

### Degraded

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Health Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Status: DEGRADED ⚠
Errors: 0 | Warnings: 3 | Info: 1

## Warnings

- [W003] Phase directory "1-setup" doesn't follow NN-name format
  Fix: Rename to "01-setup"

- [W004] config.json missing optional field "workflow.research"
  Fix: Add field or run gsd:health --repair

- [W001] REQUIREMENTS.md missing traceability matrix
  Fix: Add traceability matrix manually

---
3 issues can be auto-repaired. Run: gsd:health --repair
```

### Broken

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Health Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Status: BROKEN ✗
Errors: 2 | Warnings: 1 | Info: 0

## Errors

- [E001] config.json: JSON parse error at line 5
  Fix: Run gsd:health --repair to reset to defaults

- [E004] STATE.md references phase 5, but ROADMAP.md has only 3 phases
  Fix: Review STATE.md or run gsd:health --repair

## Warnings

- [W002] Last update was 10 days ago

---
2 errors require attention. Run: gsd:health --repair
```

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Регулярная проверка | `gsd:health` |
| После проблем в сессии | `gsd:health` |
| Перед началом работы | `gsd:health` |
| Автоматическое исправление | `gsd:health --repair` |
| В CI/CD | `gsd:health` (exit code > 0 если не healthy) |

## Вывод

```
## gsd:health завершено

**Статус:** HEALTHY / DEGRADED / BROKEN
**Ошибок:** N
**Предупреждений:** N
**Исправлено:** M (если --repair)

**Следующий шаг:**
- Если HEALTHY: Продолжить работу
- Если DEGRADED: Рассмотреть исправления
- Если BROKEN: Запустить gsd:health --repair
```
