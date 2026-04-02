# gsd:template-catalog

Каталог специализированных ролей (агентов) для задач.

## Что делает

Предоставляет каталог из 26+ специализированных "ролей" для выполнения задач.
Каждая роль имеет свою экспертизу и чек-листы.

## Как использовать

Напишите мне:
```
gsd:template-catalog
```
или для конкретной роли:
```
gsd:use-role security-auditor
gsd:use-role backend-architect
gsd:use-role frontend-developer
```

## Каталог Ролей

### 🔒 Security & Quality

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `security-auditor` | Аудит безопасности | Перед релизом, после добавления auth |
| `code-quality-auditor` | Проверка качества кода | Перед merge, рефакторинг |
| `test-architect` | Архитектура тестирования | Начало разработки, TDD setup |

### 🏗️ Architecture & Design

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `backend-architect` | Архитектура бэкенда | Проектирование API, БД |
| `frontend-architect` | Архитектура фронтенда | Компоненты, state management |
| `database-architect` | Проектирование БД | Новая схема, миграции |
| `api-designer` | Дизайн API | REST/GraphQL endpoints |

### 💻 Development

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `frontend-developer` | Фронтенд разработка | UI компоненты, стили |
| `backend-developer` | Бэкенд разработка | Бизнес-логика, API |
| `fullstack-developer` | Фулстек разработка | End-to-end фичи |
| `mobile-developer` | Мобильная разработка | iOS/Android компоненты |

### 🗄️ Data & Infrastructure

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `postgres-specialist` | PostgreSQL экспертиза | Queries, оптимизация |
| `database-admin` | Администрирование БД | Бэкапы, репликация |
| `kubernetes-specialist` | Kubernetes | Деплой, оркестрация |
| `docker-specialist` | Docker контейнеризация | Dockerfile, compose |
| `devops-engineer` | CI/CD, инфраструктура | Pipeline, деплой |

### 🎨 Design & UX

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `ui-designer` | UI дизайн | Визуальный стиль |
| `ux-researcher` | UX исследования | User flows, тестирование |
| `accessibility-specialist` | Доступность (a11y) | WCAG compliance |

### 📊 Analysis & Planning

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `business-analyst` | Бизнес-анализ | Требования, use cases |
| `technical-writer` | Техническая документация | README, API docs |
| `project-manager` | Управление проектом | Планирование, трекинг |

### 🧪 Testing & QA

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `qa-engineer` | Тестирование и QA | Test plans, automation |
| `performance-engineer` | Производительность | Load testing, оптимизация |

### 🔧 Specialized

| Роль | Описание | Когда использовать |
|------|----------|-------------------|
| `legacy-modernizer` | Модернизация легаси | Рефакторинг старого кода |
| `migration-specialist` | Миграции данных/кода | Переезд на новую версию |
| `debugging-specialist` | Отладка проблем | Production issues |

---

## Использование Роли

### Пример: Security Auditor

```
Вы: gsd:use-role security-auditor

Я: ## Security Auditor Role Activated 🔒

**Expertise:**
- OWASP Top 10
- Authentication & Authorization
- Data encryption
- Input validation
- Security headers

**Checklist для аудита:**
- [ ] SQL injection проверка
- [ ] XSS уязвимости
- [ ] CSRF защита
- [ ] Password hashing (bcrypt/argon2)
- [ ] JWT/Session security
- [ ] Rate limiting
- [ ] Security headers (CSP, HSTS)
- [ ] Secrets management

**Команды для запуска:**
- gsd:security-audit [файл/папка]
- gsd:check-auth-flow
- gsd:scan-dependencies
```

### Пример: Backend Architect

```
Вы: gsd:use-role backend-architect

Я: ## Backend Architect Role Activated 🏗️

**Expertise:**
- System design
- API design (REST, GraphQL)
- Database schema design
- Caching strategies
- Microservices vs monolith

**Подход:**
1. Анализ требований
2. Выбор архитектуры
3. Tradeoff анализ
4. Документирование решений

**Команды:**
- gsd:design-api
- gsd:schema-design
- gsd:architecture-review
```

---

## Команды

| Команда | Описание |
|---------|----------|
| `gsd:template-catalog` | Показать весь каталог |
| `gsd:use-role <name>` | Активировать роль |
| `gsd:find-role <keyword>` | Найти роль по ключевому слову |
| `gsd:recommended-role <task>` | Рекомендовать роль для задачи |

---

## Примеры Использования

### Сценарий 1: Новая фича (Auth)

```
1. gsd:use-role business-analyst   # Требования
2. gsd:use-role backend-architect  # Дизайн системы
3. gsd:use-role security-auditor   # Аудит безопасности
4. gsd:use-role backend-developer  # Реализация
5. gsd:use-role test-architect     # Тесты
```

### Сценарий 2: Оптимизация БД

```
1. gsd:use-role performance-engineer  # Профилирование
2. gsd:use-role postgres-specialist   # Query оптимизация
3. gsd:use-role database-admin        # Индексы, vacuum
```

### Сценарий 3: Подготовка к релизу

```
1. gsd:use-role code-quality-auditor  # Code review
2. gsd:use-role security-auditor      # Security scan
3. gsd:use-role qa-engineer           # QA проверка
4. gsd:use-role technical-writer      # Документация
```

---

## Добавление Новой Роли

**Формат:**

```markdown
### `role-name`

**Expertise:**
- [Навык 1]
- [Навык 2]

**Когда использовать:**
- [Сценарий 1]
- [Сценарий 2]

**Checklist:**
- [ ] Проверка 1
- [ ] Проверка 2

**Команды:**
- gsd:command-1
- gsd:command-2
```

---

## Связь с Unified Workflow

**Роли на этапах workflow:**

```
1. TASK         → business-analyst
2. BRAINSTORM   → backend-architect, frontend-architect
3. PLAN         → project-manager
4. ISOLATE      → devops-engineer
5. IMPLEMENT    → frontend-developer, backend-developer
6. REVIEW       → code-quality-auditor, security-auditor
7. VERIFY       → qa-engineer, test-architect
8. FINISH       → devops-engineer
9. CLOSE        → technical-writer
```
