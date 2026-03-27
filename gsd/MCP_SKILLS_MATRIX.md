# GSD + MCP/Skills Авто-подключение

Матрица автоматического подключения MCP серверов и Skills для каждого GSD-воркфлоу.

---

## MCP Серверы

| MCP | Что делает | Когда используется |
|-----|------------|-------------------|
| `filesystem` | Чтение/запись файлов, анализ структуры | Все воркфлоу |
| `git` | Git операции (commit, push, branch, status) | execute-phase, ship, map-codebase |
| `memory` | Долгосрочная память (PostgreSQL) | new-project, progress, settings |
| `postgres` | SQL запросы к БД проекта | map-codebase (если БД), execute-phase |
| `puppeteer` | Браузерная автоматизация | ui-review, verify-work, health |
| `playwright` | Браузерная автоматизация (альтернатива) | ui-review, verify-work |

---

## Skills

| Skill | Что делает | Когда используется |
|-------|------------|-------------------|
| `anthropic-frontend-design` | UI/UX дизайн, компоненты | ui-phase, execute-phase (frontend) |
| `web-design-guidelines` | Аудит доступности, best practices | ui-review, verify-work |
| `vercel-react-best-practices` | Оптимизация React/Next.js | execute-phase (React) |
| `review` | Code review, безопасность | review, validate-phase, ship |

---

## Матрица подключений по воркфлоу

### Core Workflow

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:new-project` | filesystem, memory | — |
| `gsd:map-codebase` | filesystem, postgres (если БД) | — |
| `gsd:discuss-phase` | filesystem | — |
| `gsd:plan-phase` | filesystem | — |
| `gsd:execute-phase` | filesystem, git | vercel-react-best-practices (React), anthropic-frontend-design (UI) |
| `gsd:verify-work` | filesystem, puppeteer | web-design-guidelines |
| `gsd:ship` | git, filesystem | review |
| `gsd:next` | filesystem | — |

### UI Workflow

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:ui-phase` | filesystem | anthropic-frontend-design |
| `gsd:ui-review` | filesystem, puppeteer | web-design-guidelines |

### Navigation

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:progress` | filesystem, memory | — |
| `gsd:manager` | filesystem, memory | — |
| `gsd:help` | — | — |
| `gsd:settings` | filesystem | — |
| `gsd:stats` | filesystem, git | — |
| `gsd:health` | filesystem | — |

### Quick Tasks

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:quick` | filesystem, git | Зависит от задачи |

### Phase Management

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:add-phase` | filesystem | — |
| `gsd:insert-phase` | filesystem | — |
| `gsd:remove-phase` | filesystem | — |
| `gsd:pause-work` | filesystem, memory | — |
| `gsd:resume-work` | filesystem, memory | — |

### Research & Audit

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:research-phase` | filesystem, puppeteer (web) | — |
| `gsd:audit-milestone` | filesystem, git | review |
| `gsd:audit-uat` | filesystem, puppeteer | web-design-guidelines |
| `gsd:forensics` | filesystem, git | — |

### Code Quality

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:debug` | filesystem | — |
| `gsd:review` | filesystem, git | review |
| `gsd:validate-phase` | filesystem, puppeteer | web-design-guidelines |

### Backlog & Threads

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:plant-seed` | memory | — |
| `gsd:add-backlog` | filesystem | — |
| `gsd:review-backlog` | filesystem | — |
| `gsd:thread` | memory | — |

### Workstreams

| Воркфлоу | MCP | Skills |
|----------|-----|--------|
| `gsd:workstreams list` | filesystem, memory | — |
| `gsd:workstreams create` | filesystem, memory | — |
| `gsd:workstreams switch` | filesystem, memory | — |
| `gsd:workstreams complete` | filesystem, memory, git | — |

---

## Примеры использования

### Пример 1: gsd:new-project

```
Пользователь: Хочу начать новый проект

Автоматически:
1. MCP: filesystem (чтение/запись .planning/)
2. MCP: memory (сохранение контекста проекта)
3. Запуск: gsd:new-project
```

### Пример 2: gsd:ui-review

```
Пользователь: Проверить UI, что получилось

Автоматически:
1. MCP: filesystem (чтение UI кода)
2. MCP: puppeteer (скриншоты, тестирование)
3. Skill: web-design-guidelines (аудит доступности)
4. Запуск: gsd:ui-review
```

### Пример 3: gsd:execute-phase (React)

```
Пользователь: Выполнить фазу 2

Автоматически:
1. MCP: filesystem (чтение планов)
2. MCP: git (коммиты после каждого плана)
3. Skill: vercel-react-best-practices (оптимизация React)
4. Запуск: gsd:execute-phase 2
```

### Пример 4: gsd:map-codebase

```
Пользователь: Проанализировать существующий проект

Автоматически:
1. MCP: filesystem (анализ структуры файлов)
2. MCP: postgres (если есть БД — анализ схемы)
3. Запуск: gsd:map-codebase
```

### Пример 5: gsd:ship

```
Пользователь: Завершить и опубликовать

Автоматически:
1. MCP: git (создание коммита, push)
2. Skill: review (проверка перед публикацией)
3. Запуск: gsd:ship
```

---

## Алгоритм авто-подключения

```
1. Распознать намерение пользователя
   ↓
2. Определить GSD воркфлоу
   ↓
3. Посмотреть матрицу подключений
   ↓
4. Подключить нужные MCP серверы
   ↓
5. Подключить нужные Skills
   ↓
6. Выполнить воркфлоу
```

---

## Формат подключения

### В начале воркфлоу

```markdown
## Контекст

**MCP Серверы:**
- ✓ filesystem — анализ файлов проекта
- ✓ git — коммиты изменений

**Skills:**
- ✓ web-design-guidelines — аудит UI

**Воркфлоу:** gsd:ui-review
```

### В процессе выполнения

```
[Использую MCP: filesystem для чтения .planning/ROADMAP.md]
[Применяю Skill: web-design-guidelines для проверки accessibility]
```

---

## Примечания

1. **MCP подключаются автоматически** — пользователю не нужно указывать
2. **Skills применяются контекстно** — только если релевантны задаче
3. **Если MCP недоступен** — продолжаю без него с предупреждением
4. **Если Skill не применим** — пропускаю без уведомления

---

## Версия

**Документ:** v1.0
**Обновлено:** 27 марта 2026
