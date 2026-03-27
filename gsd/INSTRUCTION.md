# GSD для Qwen Code — Инструкция

## Установка завершена ✓

GSD адаптирован для работы с Qwen Code в ручном режиме.

## Структура

```
~/.qwen/gsd/
├── README.md           — Эта инструкция
├── config.json         — Конфигурация
├── workflows/          — Воркфлоу команд
│   ├── new-project.md
│   ├── help.md
│   ├── progress.md
│   ├── plan-phase.md
│   ├── execute-phase.md
│   ├── verify-work.md
│   └── ship.md
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

| Команда | Описание |
|---------|----------|
| `gsd:new-project` | Инициализация проекта |
| `gsd:plan-phase 1` | Планирование фазы 1 |
| `gsd:execute-phase 1` | Выполнение фазы 1 |
| `gsd:verify-work` | Проверка работы (UAT) |
| `gsd:ship` | Завершение и публикация |
| `gsd:progress` | Показать текущий статус |
| `gsd:help` | Показать все команды |
| `gsd:quick: [задача]` | Быстрая задача |

## Пример сессии

```
Вы: gsd:new-project
Я: Задаю вопросы о проекте...
   Создаю .planning/PROJECT.md, REQUIREMENTS.md, ROADMAP.md...

Вы: gsd:plan-phase 1
Я: Читаю ROADMAP.md, создаю детальные планы...

Вы: gsd:execute-phase 1
Я: Выполняю планы, обновляю STATE.md...

Вы: gsd:verify-work
Я: Проверяю по критериям успеха...

Вы: gsd:ship
Я: Создаю коммит, обновляю статусы...
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
