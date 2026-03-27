# gsd:ui-phase

Создание контракта на разработку UI (UI-SPEC.md) для фазы N.

## Что делает

1. Анализирует планы фазы N из ROADMAP.md
2. Выявляет все UI-компоненты и взаимодействия
3. Создаёт детальный UI-SPEC.md с:
   - Визуальными референсами
   - Компонентами и состояниями
   - Анимациями и переходами
   - Адаптивностью
   - Доступностью
4. Обновляет ROADMAP.md с UI-задачами

## Как использовать

```
gsd:ui-phase 1
gsd:ui-phase 2 --detailed
```

## Процесс

### Шаг 1: Контекст
- Читаю ROADMAP.md — планы фазы N
- Выявляю UI-требования
- Читаю PROJECT.md — бренд, стиль

### Шаг 2: UI-SPEC.md

Создаю `.planning/ui-specs/phase-N-UI-SPEC.md`:

```markdown
# UI Specification: Phase N

## Обзор

[Что строим в этой фазе]

## Страницы/Экраны

### [Название страницы]
**URL:** `/path`
**Цель:** [Зачем нужна эта страница]

#### Wireframe
[Схематичное описание布局]

#### Компоненты
- Header
- Navigation
- [Component 1]
- [Component 2]
- Footer

#### Состояния
- **Загрузка:** [Skeleton/Spinner]
- **Пусто:** [Empty state]
- **Ошибка:** [Error state]
- **Успех:** [Data loaded]

#### Адаптивность
| Breakpoint | Поведение |
|------------|-----------|
| Mobile (<640px) | [Описание] |
| Tablet (640-1024px) | [Описание] |
| Desktop (>1024px) | [Описание] |

---

## Компоненты

### [Component Name]

**Назначение:** [Что делает]

**Props:**
```ts
interface Props {
  prop1: type;
  prop2: type;
}
```

**Состояния:**
- Default: [описание]
- Hover: [описание]
- Active: [описание]
- Disabled: [описание]
- Loading: [описание]

**Взаимодействия:**
- Клик → [действие]
- Hover → [эффект]
- Focus → [эффект]

**Анимации:**
- Transition: [duration, easing]
- Animation: [name, duration, loop]

---

## Дизайн-токены

### Цвета
```css
--color-primary: #XXX;
--color-secondary: #XXX;
--color-accent: #XXX;
--color-error: #XXX;
--color-success: #XXX;
```

### Типографика
```css
--font-family: 'XXX', sans-serif;
--font-size-base: 16px;
--line-height: 1.5;
```

### Отступы
```css
--spacing-xs: 4px;
--spacing-sm: 8px;
--spacing-md: 16px;
--spacing-lg: 24px;
--spacing-xl: 32px;
```

---

## Доступность (a11y)

- [ ] Контраст цветов ≥ 4.5:1
- [ ] Focus indicators видны
- [ ] ARIA labels для интерактивных элементов
- [ ] Keyboard navigation работает
- [ ] Screen reader совместимость

---

## Референсы

- [Ссылка на Figma/Sketch]
- [Ссылка на скриншот]
- [Конкурент/вдохновение]
```

### Шаг 3: Обновление ROADMAP.md

Добавляю UI-планы в фазу N:

```markdown
### Phase N: UI Plans

- [ ] UI-N-01: [Компонент 1] — см. UI-SPEC.md
- [ ] UI-N-02: [Компонент 2] — см. UI-SPEC.md
- [ ] UI-N-03: [Страница/Экран] — см. UI-SPEC.md
```

### Шаг 4: Вывод

```
## gsd:ui-phase N завершено

**Создано:** `.planning/ui-specs/phase-N-UI-SPEC.md`

**UI-компоненты:** N компонентов
**Страницы/Экраны:** M страниц

**Следующий шаг:** 
- gsd:plan-phase N (если ещё не планировали)
- gsd:execute-phase N (если готовы кодить)
```

## Флаги

| Флаг | Описание |
|------|----------|
| `--detailed` | Расширенная спецификация с микро-взаимодействиями |
| `--figma` | Экспорт структуры для Figma (JSON) |

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Фаза с UI-работой | `gsd:ui-phase N` |
| Сложный UI, много компонентов | `gsd:ui-phase N --detailed` |
| Нужен контракт для дизайнера | `gsd:ui-phase N` |
| Frontend-команда ждёт спецификацию | `gsd:ui-phase N` |
