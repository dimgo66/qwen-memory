# gsd:quick

Быстрое выполнение ad-hoc задач с гарантиями GSD.

## Что делает

1. Выполняет небольшие задачи без полной церемонии
2. Атомарные коммиты
3. Трекинг в STATE.md
4. Опционально: discussion, research, plan-checking, verification

## Как использовать

```
gsd:quick [задача]
gsd:quick [задача] --discuss
gsd:quick [задача] --research
gsd:quick [задача] --full
gsd:quick [задача] --discuss --research --full
```

## Флаги

| Флаг | Описание |
|------|----------|
| `--discuss` | Обсуждение перед планированием (выявление серых зон) |
| `--research` | Исследование подходов перед планированием |
| `--full` | Plan-checking + верификация (максимум 2 итерации) |

## Режимы

### Базовый режим

```
gsd:quick: Добавить валидацию email в форму

→ Планирование
→ Выполнение
→ Коммит
```

### С обсуждением

```
gsd:quick: Добавить кэширование --discuss

→ Обсуждение (выявление вопросов)
→ Решения → CONTEXT.md
→ Планирование
→ Выполнение
→ Коммит
```

### С исследованием

```
gsd:quick: Оптимизировать загрузку изображений --research

→ Исследование подходов
→ Сравнение библиотек
→ Рекомендации
→ Планирование
→ Выполнение
→ Коммит
```

### Полный режим

```
gsd:quick: Рефакторинг auth --discuss --research --full

→ Обсуждение
→ Исследование
→ Планирование
→ Plan-checking (макс 2 итерации)
→ Выполнение
→ Верификация
→ Коммит
```

## Процесс

### Шаг 1: Парсинг аргументов

```
АРГУМЕНТЫ: "Добавить кэширование --discuss --research --full"

$DISCUSS_MODE = true
$RESEARCH_MODE = true
$FULL_MODE = true
$DESCRIPTION = "Добавить кэширование"
```

### Шаг 2: Баннер

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 GSD ► QUICK TASK (DISCUSS + RESEARCH + FULL)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

◆ Discussion + research + plan checking + verification enabled
```

### Шаг 3: Discussion (если --discuss)

```markdown
## Quick Task: CONTEXT

**Задача:** Добавить кэширование

**Выявленные вопросы:**

1. **Где кэшировать?**
   - На уровне API?
   - На уровне store?
   - HTTP кэширование?

**Принятые решения:**

- ✓ Кэширование на уровне store (Pinia)
- ✓ TTL: 5 минут
- ✓ Инвалидация при мутациях

**Допущения:**

- Используем `vue-query` или аналог
- Кэшируем только GET запросы
```

### Шаг 4: Research (если --research)

```markdown
## Quick Task: RESEARCH

**Задача:** Добавить кэширование

**Рассмотренные подходы:**

1. **vue-query (TanStack Query)**
   - Плюсы: Автоматическая инвалидация, retry logic
   - Минусы: Дополнительная зависимость
   - Когда: Сложные данные, частые обновления

2. **SWR Vue**
   - Плюсы: Лёгкий, простой API
   - Минусы: Меньше функций
   - Когда: Простые сценарии

3. **Custom Pinia plugin**
   - Плюсы: Полный контроль, нет зависимостей
   - Минусы: Нужно писать самому
   - Когда: Специфичные требования

**Рекомендация:** vue-query

**Почему:** Лучший баланс функций и простоты
```

### Шаг 5: Планирование

```markdown
## Quick Task: PLAN

**Задача:** Добавить кэширование

**Планы:**

- [ ] 01: Установить vue-query
- [ ] 02: Настроить VueQueryPlugin
- [ ] 03: Обернуть API вызовы в useQuery
- [ ] 04: Настроить инвалидацию
```

### Шаг 6: Plan Checking (если --full)

```markdown
## Plan Review

**Итерация 1:**

✓ План атомарный
✓ Зависимости явные
✗ Нет критериев приёмки

**Итерация 2 (исправлено):**

✓ План атомарный
✓ Зависимости явные
✓ Критерии приёмки есть

**Статус:** APPROVED
```

### Шаг 7: Выполнение

```
## Выполнение

✓ План 01: Установить vue-query — 2 мин
✓ План 02: Настроить VueQueryPlugin — 5 мин
✓ План 03: Обернуть API вызовы — 15 мин
✓ План 04: Настроить инвалидацию — 8 мин

**Итого:** 30 мин
```

### Шаг 8: Верификация (если --full)

```markdown
## Verification

**Критерии:**

✓ vue-query установлен
✓ Plugin настроен в main.js
✓ API вызовы используют useQuery
✓ Инвалидация работает

**Статус:** PASS
```

### Шаг 9: Коммит

```bash
git add .
git commit -m "quick: Add caching with vue-query

- Install @tanstack/vue-query
- Configure VueQueryPlugin
- Wrap API calls in useQuery
- Setup invalidation on mutations

Refs: QUICK-001"
```

### Шаг 10: Обновление STATE.md

```markdown
## Quick Tasks Completed

| ID | Task | Duration | Status | Date |
|----|------|----------|--------|------|
| QUICK-001 | Add caching | 30 min | ✓ Shipped | 2026-03-27 |
```

## Вывод

```
## gsd:quick завершено

**Задача:** Добавить кэширование
**Режим:** DISCUSS + RESEARCH + FULL

**Выполнено:**
✓ Discussion — 3 решения
✓ Research — 3 подхода рассмотрено
✓ Planning — 4 плана
✓ Execution — 30 мин
✓ Verification — PASS

**Коммит:** abc123f

**Следующий шаг:** 
- gsd:quick [следующая задача]
- gsd:progress
```

## Трекинг файлов

```
.planning/
├── quick/
│   └── QUICK-001/
│       ├── CONTEXT.md    (если --discuss)
│       ├── RESEARCH.md   (если --research)
│       ├── PLAN.md
│       └── SUMMARY.md
└── STATE.md              (обновляется)
```

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Простая задача | `gsd:quick [задача]` |
| Есть серые зоны | `gsd:quick [задача] --discuss` |
| Не знаком с подходом | `gsd:quick [задача] --research` |
| Критичная задача | `gsd:quick [задача] --full` |
| Сложная задача | `gsd:quick [задача] --discuss --research --full` |

## Примеры

```
gsd:quick: Добавить валидацию email
gsd:quick: Исправить баг с навигацией --full
gsd:quick: Оптимизировать изображения --research
gsd:quick: Рефакторинг utils --discuss --full
gsd:quick: Настроить CI/CD --discuss --research --full
```
