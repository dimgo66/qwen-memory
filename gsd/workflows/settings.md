# gsd:settings

Конфигурация профиля модели и агентов GSD.

## Что делает

1. Показывает текущие настройки
2. Позволяет изменить конфигурацию
3. Управляет профилями моделей
4. Настраивает workflow агентов

## Как использовать

```
gsd:settings
gsd:settings --edit
gsd:set-profile quality
gsd:set-profile balanced
gsd:set-profile budget
```

## Конфигурация (.planning/config.json)

### Core Settings

| Настройка | Опции | По умолчанию | Описание |
|-----------|-------|--------------|----------|
| `mode` | `yolo`, `interactive` | `interactive` | Авто-подтверждение или подтверждение на каждом шаге |
| `granularity` | `coarse`, `standard`, `fine` | `standard` | Гранулярность фаз — как мелко делится scope |

### Model Profiles

| Профиль | Planning | Execution | Verification |
|---------|----------|-----------|--------------|
| `quality` | Opus | Opus | Sonnet |
| `balanced` | Opus | Sonnet | Sonnet |
| `budget` | Sonnet | Sonnet | Haiku |
| `inherit` | Inherit | Inherit | Inherit |

### Workflow Agents

| Настройка | Default | Описание |
|-----------|---------|----------|
| `workflow.research` | `true` | Исследование домена перед планированием каждой фазы |
| `workflow.plan_check` | `true` | Верификация планов перед выполнением |
| `workflow.verifier` | `true` | Подтверждение доставки must-haves после выполнения |
| `workflow.auto_advance` | `false` | Авто-цепочка discuss → plan → execute |
| `workflow.discuss_mode` | `discuss` | `discuss` (интервью) или `assumptions` (сначала код) |
| `workflow.skip_discuss` | `false` | Пропускать discuss-phase в автономном режиме |

### Execution

| Настройка | Default | Описание |
|-----------|---------|----------|
| `parallelization.enabled` | `true` | Запуск независимых планов одновременно |
| `planning.commit_docs` | `true` | Трекать .planning/ в git |
| `hooks.context_warnings` | `true` | Показывать предупреждения об использовании контекстного окна |

### Git Branching

| Настройка | Опции | Default | Описание |
|-----------|-------|---------|----------|
| `git.branching_strategy` | `none`, `phase`, `milestone` | `none` | Стратегия создания веток |
| `git.phase_branch_template` | string | `gsd/phase-{phase}-{slug}` | Шаблон для веток фаз |
| `git.milestone_branch_template` | string | `gsd/{milestone}-{slug}` | Шаблон для веток milestone |

## Процесс

### Шаг 1: Чтение конфигурации

```bash
cat .planning/config.json
```

### Шаг 2: Показ текущих настроек

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD Settings
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## Current Configuration

### Core
- Mode: interactive
- Granularity: standard

### Model Profile
- Current: balanced
- Planning: Opus
- Execution: Sonnet
- Verification: Sonnet

### Workflow
- Research: ✓ enabled
- Plan Check: ✓ enabled
- Verifier: ✓ enabled
- Auto Advance: ✗ disabled
- Discuss Mode: discuss (interview)

### Execution
- Parallelization: ✓ enabled
- Commit Docs: ✓ enabled
- Context Warnings: ✓ enabled

### Git
- Branching Strategy: none
- Phase Branch Template: gsd/phase-{phase}-{slug}
- Milestone Branch Template: gsd/{milestone}-{slug}
```

### Шаг 3: Интерактивное редактирование

```
## Edit Settings

Выберите что изменить:

[1] Mode (interactive)
[2] Granularity (standard)
[3] Model Profile (balanced)
[4] Workflow Research (enabled)
[5] Workflow Plan Check (enabled)
[6] Workflow Verifier (enabled)
[7] Workflow Auto Advance (disabled)
[8] Workflow Discuss Mode (discuss)
[9] Parallelization (enabled)
[10] Commit Docs (enabled)
[11] Git Branching (none)

[q] Save & Exit

Ваш выбор: _
```

### Шаг 4: Смена профиля

```
gsd:set-profile quality

## Model Profile Changed

**Previous:** balanced
- Planning: Opus → Opus
- Execution: Sonnet → Opus
- Verification: Sonnet → Sonnet

**New:** quality
- Planning: Opus
- Execution: Opus
- Verification: Sonnet

Profile updated in .planning/config.json
```

## Профили моделей

### quality

```
Для критичных проектов, где качество важнее стоимости.

Planning: Opus    — лучшее планирование
Execution: Opus   — лучшее выполнение
Verification: Sonnet — достаточная верификация

Стоимость: $$$
```

### balanced (default)

```
Баланс качества и стоимости.

Planning: Opus    — хорошее планирование
Execution: Sonnet — достаточное выполнение
Verification: Sonnet — достаточная верификация

Стоимость: $$
```

### budget

```
Для бюджетных проектов.

Planning: Sonnet  — достаточное планирование
Execution: Sonnet — достаточное выполнение
Verification: Haiku — базовая верификация

Стоимость: $
```

### inherit

```
Наследовать настройки от runtime.

Planning: Inherit
Execution: Inherit
Verification: Inherit

Использует модель, настроенную в Claude Code / другом runtime.
```

## Примеры config.json

### Базовая конфигурация

```json
{
  "version": "1.29.0",
  "mode": "interactive",
  "granularity": "standard",
  "profile": "balanced",
  "workflow": {
    "research": true,
    "plan_check": true,
    "verifier": true,
    "auto_advance": false,
    "discuss_mode": "discuss"
  },
  "execution": {
    "parallelization": {
      "enabled": true
    },
    "commit_docs": true,
    "context_warnings": true
  },
  "git": {
    "branching_strategy": "none",
    "phase_branch_template": "gsd/phase-{phase}-{slug}",
    "milestone_branch_template": "gsd/{milestone}-{slug}"
  }
}
```

### Продвинутая конфигурация

```json
{
  "version": "1.29.0",
  "mode": "yolo",
  "granularity": "fine",
  "profile": "quality",
  "workflow": {
    "research": true,
    "plan_check": true,
    "verifier": true,
    "auto_advance": true,
    "discuss_mode": "assumptions",
    "skip_discuss": false,
    "research_before_questions": false
  },
  "execution": {
    "parallelization": {
      "enabled": true,
      "max_concurrent": 3
    },
    "commit_docs": true,
    "context_warnings": true
  },
  "git": {
    "branching_strategy": "phase",
    "phase_branch_template": "gsd/phase-{phase}-{slug}",
    "milestone_branch_template": "gsd/{milestone}-{slug}"
  }
}
```

## Вывод

```
## gsd:settings завершено

**Configuration:** .planning/config.json

**Current Profile:** balanced
**Mode:** interactive
**Granularity:** standard

**Workflow:**
- Research: ✓
- Plan Check: ✓
- Verifier: ✓
- Auto Advance: ✗

**Следующий шаг:**
- gsd:set-profile [profile] — сменить профиль
- gsd:settings --edit — редактировать настройки
```

## Команды

| Команда | Описание |
|---------|----------|
| `gsd:settings` | Показать текущие настройки |
| `gsd:settings --edit` | Интерактивное редактирование |
| `gsd:set-profile quality` | Установить профиль quality |
| `gsd:set-profile balanced` | Установить профиль balanced |
| `gsd:set-profile budget` | Установить профиль budget |
| `gsd:set-profile inherit` | Установить профиль inherit |

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Проверить настройки | `gsd:settings` |
| Сменить профиль | `gsd:set-profile [name]` |
| Настроить workflow | `gsd:settings --edit` |
| Перед большим проектом | `gsd:settings --edit` |
