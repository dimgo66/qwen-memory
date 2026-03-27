# gsd:map-codebase

Анализ существующей кодовой базы перед инициализацией проекта.

## Что делает

1. Анализирует структуру проекта
2. Определяет технологический стек
3. Выявляет архитектуру и паттерны
4. Находит конвенции и лучшие практики
5. Создаёт документы в `.planning/codebase/`

## Как использовать

```
gsd:map-codebase
gsd:map-codebase [area]  # Конкретная область
```

## Создаваемые файлы

```
.planning/codebase/
├── STACK.md          # Технологический стек
├── INTEGRATIONS.md   # Внешние интеграции (API, сервисы)
├── ARCHITECTURE.md   # Архитектура системы
├── STRUCTURE.md      # Структура проекта
├── CONVENTIONS.md    # Конвенции кода
├── TESTING.md        # Тестирование
└── CONCERNS.md       # Проблемные области
```

## Процесс

### Шаг 1: Проверка существующих карт

```
Если .planning/codebase/ существует:

.planning/codebase/ уже существует:
- STACK.md
- ARCHITECTURE.md
- STRUCTURE.md

Что дальше?
1. Refresh — Удалить и пересоздать
2. Update — Обновить конкретные документы
3. Skip — Использовать существующие
```

### Шаг 2: Создание структуры

```bash
mkdir -p .planning/codebase
```

### Шаг 3: Параллельный анализ

**Анализ стека:**
- package.json / requirements.txt
- Конфигурации (vite.config, tsconfig, etc.)
- Зависимости и их назначение

**Анализ архитектуры:**
- Структура директорий
- Слои (components, services, utils)
- Паттерны (MVC, MVVM, etc.)

**Анализ конвенций:**
- Стили кода
- Именование
- Структура файлов

### Шаг 4: Документы

#### STACK.md

```markdown
# Tech Stack

## Frontend
- **Framework:** Vue 3.3 + Vite
- **State:** Pinia
- **Router:** Vue Router 4
- **UI:** Bootstrap 5
- **CSS:** SCSS modules

## Backend
- **Runtime:** Node.js 18
- **Framework:** FastAPI
- **Database:** PostgreSQL 15

## DevOps
- **Deploy:** Docker + Docker Compose
- **CI/CD:** GitHub Actions
```

#### ARCHITECTURE.md

```markdown
# Architecture

## Overview

[Diagram и описание]

## Layers

### Presentation
- Components: `src/components/`
- Views: `src/views/`
- Layouts: `src/layouts/`

### Business Logic
- Stores: `src/stores/`
- Services: `src/services/`
- Composables: `src/composables/`

### Data Access
- API: `src/api/`
- Types: `src/types/`
```

#### STRUCTURE.md

```markdown
# Project Structure

```
vtornik-vue/
├── src/
│   ├── components/     # Переиспользуемые компоненты
│   ├── views/          # Страничные компоненты
│   ├── stores/         # Pinia stores
│   ├── api/            # API клиенты
│   └── utils/          # Утилиты
├── public/
├── tests/
└── .planning/
```

## Key Files

- `src/main.js` — Точка входа
- `src/App.vue` — Корневой компонент
- `vite.config.js` — Конфигурация сборки
```

#### CONVENTIONS.md

```markdown
# Code Conventions

## Naming

- Components: PascalCase (`UserCard.vue`)
- Composables: `useXxx()` (`useAuth()`)
- Stores: `useXxxStore()` (`useUserStore()`)

## File Structure

- One component per file
- Co-locate tests: `ComponentName.test.js`

## Code Style

- ESLint: Airbnb + Vue recommendations
- Prettier: 2 spaces, single quotes
```

#### TESTING.md

```markdown
# Testing

## Test Framework
- Vitest для unit-тестов
- Vue Test Utils для компонентных тестов

## Coverage
- Target: 80%
- Current: 65%

## Running Tests
```bash
npm run test
npm run test:coverage
```
```

#### CONCERNS.md

```markdown
# Known Concerns

## Technical Debt

1. **Отсутствует типизация**
   - Где: `src/utils/helpers.js`
   - Влияние: Сложность рефакторинга

2. **Дублирование кода**
   - Где: `src/components/` и `src/views/`
   - Влияние: Поддержка

## Performance Issues

1. **Большие бандлы**
   - Размер: 2.5MB
   - Причина: Нет code splitting
```

### Шаг 5: Вывод

```
## gsd:map-codebase завершено

**Создано:** `.planning/codebase/`

**Документы:**
✓ STACK.md — Технологический стек
✓ ARCHITECTURE.md — Архитектура
✓ STRUCTURE.md — Структура
✓ CONVENTIONS.md — Конвенции
✓ TESTING.md — Тестирование
✓ CONCERNS.md — Проблемы

**Следующий шаг:** gsd:new-project
```

## Области анализа

| Область | Что анализирует |
|---------|-----------------|
| (без области) | Вся кодовая база |
| `frontend` | Только frontend код |
| `backend` | Только backend код |
| `tests` | Тестовая инфраструктура |
| `api` | API интеграции |

## Когда использовать

| Ситуация | Команда |
|----------|---------|
| Существующий проект | `gsd:map-codebase` |
| Перед new-project | `gsd:map-codebase` |
| Онбординг разработчика | `gsd:map-codebase` |
| Аудит кода | `gsd:map-codebase` |
