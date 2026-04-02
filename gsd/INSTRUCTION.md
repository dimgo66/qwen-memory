# GSD для Qwen Code — Инструкция

## Установка завершена ✓

GSD адаптирован для работы с Qwen Code в ручном режиме с практиками **Superpowers** и **Beads**.

## 🆕 Superpowers Integration

**Встроенные практики:**

1. **TDD (Test-Driven Development)** — сначала тесты, потом код
2. **Code Review** — обязательное ревью перед `gsd:ship`
3. **Requirements Spec** — уточнение требований до планирования
4. **Verification Before Completion** — чеклист перед завершением

## 🆕 Beads Integration

**Встроенные практики:**

1. **Dependency Graph** — граф зависимостей между планами
2. **Ready Check** — авто-определение готовых планов (без блокировок)
3. **Hash-based ID** — уникальные ID планов (`01-01.a3f8`)
4. **Compaction** — архивация выполненных фаз с суммаризацией

## Структура

```
~/.qwen/gsd/
├── README.md           — Эта инструкция
├── INSTRUCTION.md      — Полная инструкция
├── config.json         — Конфигурация
├── workflows/          — Воркфлоу команд
│   ├── new-project.md
│   ├── requirements-spec.md  ← Уточнение требований
│   ├── discuss-phase.md
│   ├── plan-phase.md         ← Hash-based ID + Dependency Graph
│   ├── execute-phase.md      ← TDD RED-GREEN-REFACTOR + Ready Check
│   ├── verify-work.md        ← Verification checklist
│   ├── ship.md               ← Code review перед ship
│   ├── dependency-graph.md   ← Граф зависимостей + Ready
│   ├── compact.md            ← Архивация с суммаризацией
│   ├── progress.md           ← Progress + Ready планы
│   ├── help.md
│   └── ...
└── templates/          — Шаблоны файлов
    ├── project.md
    ├── requirements.md
    ├── roadmap.md
    └── state.md
```

## Как начать проект

### Шаг 1: Откройте проект

```bash
cd /path/to/your/project
```

### Шаг 2: Инициализируйте проект

Скажите мне (Qwen Code):
```
gsd:new-project
```

Или с идеей:
```
gsd:new-project: Хочу создать сайт для конкурса фотографий
```

### Шаг 3: Ответьте на вопросы

Я задам вопросы:
- Что строим?
- Для кого?
- Основная ценность?
- Ограничения?

### Шаг 4: Получите план

После вопросов я создам:
```
.planning/
├── PROJECT.md          — Контекст проекта
├── REQUIREMENTS.md     — Требования
├── ROADMAP.md          — Дорожная карта по фазам
├── STATE.md            — Текущее состояние
└── config.json         — Настройки воркфлоу
```

## Команды

После инициализации используйте команды:

### Core

| Команда | Описание |
|---------|----------|
| `gsd:new-project` | Инициализация проекта |
| `gsd:requirements-spec 1` | **Уточнение требований** фазы 1 |
| `gsd:discuss-phase 1` | Обсуждение деталей фазы 1 |
| `gsd:plan-phase 1` | Планирование фазы 1 |
| `gsd:execute-phase 1` | Выполнение фазы 1 **(TDD)** |
| `gsd:verify-work` | Проверка работы (UAT + Verification) |
| `gsd:ship` | Завершение и публикация **(с code review)** |

### Dependency Graph (Beads)

| Команда | Описание |
|---------|----------|
| `gsd:dependency-graph 1` | Построить граф зависимостей фазы 1 |
| `gsd:ready` | Показать готовые планы (без блокировок) |
| `gsd:progress` | Показать статус + ready планы |

### Archive

| Команда | Описание |
|---------|----------|
| `gsd:compact 1` | Архивировать выполненную фазу 1 |

### Quick

| Команда | Описание |
|---------|----------|
| `gsd:quick: [задача]` | Быстрая задача |
| `gsd:help` | Показать все команды |

## Пример сессии

```
Вы: gsd:new-project
Я: Задаю вопросы о проекте...
   Создаю .planning/PROJECT.md, REQUIREMENTS.md, ROADMAP.md...

Вы: gsd:requirements-spec 1
Я: Уточняю требования, создаю acceptance criteria, тест-кейсы...

Вы: gsd:plan-phase 1
Я: Создаю планы с hash-based ID, строю dependency graph...

Вы: gsd:dependency-graph 1
Я: Показываю граф, определяю критический путь, bottlenecks...

Вы: gsd:ready
Я: Показываю планы без блокировок...

Вы: gsd:execute-phase 1
Я: TDD цикл (RED → GREEN → REFACTOR), обновляю STATE.md...

Вы: gsd:progress
Я: Показываю статус, dependency graph, ready планы...

Вы: gsd:verify-work
Я: Проверяю по критериям успеха, запускаю тесты, чеклист...

Вы: gsd:ship
Я: Code review, создаю коммит, обновляю статусы...

Вы: gsd:compact 1
Я: Архивирую фазу с суммаризацией...
```

## Файлы проекта

### .planning/PROJECT.md
- Что это за проект
- Основная ценность
- Требования (Validated, Active, Out of Scope)
- Контекст и ограничения
- Ключевые решения

### .planning/ROADMAP.md
- Фазы проекта
- Success criteria для каждой фазы
- Планы внутри фаз
- Прогресс выполнения

### .planning/STATE.md
- Текущая позиция (фаза, план)
- Метрики скорости
- Накопленный контекст
- Session continuity

### .planning/REQUIREMENTS.md
- Детальные требования с ID (REQ-01...)
- Критерии приёмки
- Traceability matrix

## Git интеграция

По умолчанию GSD автоматически коммитит изменения:

```bash
git add .planning/
git commit -m "GSD: Phase 1 Plan complete"
```

Для отключения авто-коммитов измените `~/.qwen/gsd/config.json`:
```json
"workflow": {
  "auto_commit": false
}
```

## Обновление

Для обновления GSD:
```
gsd:update
```

Или вручную:
```bash
npx get-shit-done-cc@latest
```

## Поддержка

- Документация: https://github.com/gsd-build/get-shit-done
- Discord: https://discord.gg/gsd
