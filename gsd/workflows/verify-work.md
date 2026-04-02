# gsd:verify-work

Проверка выполненной работы (UAT + Verification Before Completion).

## Что делает

1. Сравнивает результат с требованиями
2. Проверяет success criteria
3. **Запускает полный тест-сьют**
4. **Проверяет качество кода**
5. Выявляет проблемы
6. Готовит отчёт о верификации

## Как использовать

Напишите мне:
```
gsd:verify-work
```
или для конкретной фазы:
```
gsd:verify-work 1
```

## Процесс

### Шаг 1: Чтение контекста
- PROJECT.md — требования
- ROADMAP.md — success criteria фазы
- STATE.md — что выполнено
- **REQUIREMENTS.md — acceptance criteria**

### Шаг 1.5: Автоматическая верификация

**Запуск тестов:**
```bash
npm test          # или pytest, jest, etc.
npm test:coverage # проверка покрытия
```

**Требования к тестам:**
- ✅ Все тесты PASS
- ✅ Покрытие ≥ 80% (критичные модули ≥ 90%)
- ✅ Нет skipped тестов без причин

**Проверка качества:**
```bash
npm run lint      # ESLint/Prettier
npm run typecheck # TypeScript
```

### Шаг 2: Проверка по критериям

Для каждого success criteria:
```
✓ Критерий 1: [описание]
  - Статус: PASS / FAIL / PARTIAL
  - Доказательство: [скриншот, тест, лог]

✗ Критерий 2: [описание]
  - Статус: FAIL
  - Проблема: [описание]
  - Рекомендация: [как исправить]
```

### Шаг 3: UAT отчёт

```markdown
# UAT: Phase 1

## Summary
- Passed: 5/7 критериев
- Failed: 2 критерия
- Статус: NEEDS_FIXES

## Issues
1. [Критерий 2] — не работает [...]
2. [Критерий 5] — частично работает [...]

## Рекомендации
- Исправить Issue 1, 2
- Перепроверить
```

### Шаг 3.5: Verification Checklist

**Перед отметкой "готово":**
- [ ] Все acceptance criteria из REQUIREMENTS.md проверены
- [ ] Все тесты PASS (100% зелёные)
- [ ] Тестовое покрытие ≥ 80%
- [ ]Lint проходит без ошибок
- [ ] TypeScript компилируется без ошибок
- [ ] Нет console.error/console.warn в логах
- [ ] Производительность в норме (no memory leaks, slow queries)
- [ ] Безопасность проверена (no hardcoded secrets, SQL injection risks)

### Шаг 4: Решение

**Если всё OK:**
- Готово к `gsd:ship`

**Если есть проблемы:**
- `gsd:do: исправить Issue 1, 2`
- Затем снова `gsd:verify-work`

## После завершения

Следующая команда: `gsd:ship` (если всё OK)
