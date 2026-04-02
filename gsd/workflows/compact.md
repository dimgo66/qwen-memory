# gsd:compact

Архивация выполненных фаз с суммаризацией (compaction).

## Что делает

1. Находит завершённые фазы
2. Создаёт сжатую суммаризацию
3. Перемещает детали в архив
4. Обновляет ROADMAP.md и STATE.md

## Как использовать

Напишите мне:
```
gsd:compact 1
```
или для нескольких фаз:
```
gsd:compact 1,2
```

## Процесс

### Шаг 1: Поиск завершённых фаз

**Анализирую ROADMAP.md:**
- Фазы со статусом `shipped` или `done`
- Фазы, которые не в активной работе

### Шаг 2: Создание суммаризации

**Compact Summary:**

```markdown
### Phase 1: [Name] — Completed ✓

**Период**: 2026-04-01 — 2026-04-15
**Длительность**: 14 дней
**Планов выполнено**: 12
**Время**: 18 часов

**Достижения**:
- ✓ [Ключевая фича 1]
- ✓ [Ключевая фича 2]
- ✓ [Ключевая фича 3]

**Метрики**:
- Тестов: 145 passed
- Покрытие: 87%
- Code review: ✓
- Issues закрыто: 23

**Ссылки**:
- [Архив](.planning/archive/phase-1.md)
- [Коммиты](link-to-git)
```

### Шаг 3: Архивация деталей

**Создаю `.planning/archive/phase-N.md`:**

```markdown
# Phase 1 Archive

## Original Plans

| План | Название | Время | Статус |
|------|----------|-------|--------|
| 01-01.a3f8 | Auth Setup | 45 мин | done |
| 01-02.b7c1 | API | 90 мин | done |
...

## Dependencies Graph
[Original graph structure]

## Issues & Fixes
[Список проблем и решений]

## Lessons Learned
[Извлечённые уроки]
```

### Шаг 4: Обновление ROADMAP.md

**До:**
```markdown
### Phase 1: [Name]
**Goal**: [detailed description...]
**Plans**:
- [x] 01-01: [details...]
- [x] 01-02: [details...]
... (50+ lines)
```

**После:**
```markdown
### Phase 1: [Name] — Completed ✓
**Compact**: 12 plans, 18 hours, shipped 2026-04-15
**Archive**: [.planning/archive/phase-1.md](.planning/archive/phase-1.md)
```

### Шаг 5: Обновление STATE.md

```markdown
## Archived Phases

| Phase | Status | Archived | Date |
|-------|--------|----------|------|
| 1 | shipped | ✓ | 2026-04-15 |
| 2 | shipped | ✓ | 2026-04-25 |
```

## Чек-лист

Перед compaction:
- [ ] Фаза завершена (shipped)
- [ ] Все тесты прошли
- [ ] Code review выполнено
- [ ] Документация обновлена
- [ ] Архив создан

## Результат

```markdown
## Compaction Complete ✓

**Архивировано**:
- Phase 1: 12 планов → 1 summary + archive
- Phase 2: 8 планов → 1 summary + archive

**ROADMAP.md**:
- Было: 450 строк
- Стало: 120 строк
- Сокращение: 73%

**Активные фазы**: 2 (Phase 3, 4)
**Архив**: `.planning/archive/`
```

## Преимущества

| До | После |
|----|-------|
| ROADMAP.md 500+ строк | ROADMAP.md 100-150 строк |
| Долгий поиск актуального | Быстрый фокус на активном |
| Потеря контекста | Сохранено в архиве |

## После завершения

**Файлы:**
- `.planning/archive/phase-N.md` — детальный архив
- `ROADMAP.md` — сжатый вид
- `STATE.md` — обновлённый статус
