# gsd:using-git-worktrees

Изоляция фич в отдельных worktrees для параллельной разработки.

## Что делает

Создаёт изолированные рабочие деревья для каждой фазы/фичи.
Позволяет работать над несколькими задачами параллельно без конфликтов.

## Как использовать

Напишите мне:
```
gsd:using-git-worktrees 1
```
или
```
gsd:isolate-phase 1
```

## Процесс

### Шаг 1: Проверка готовности

**Перед созданием worktree:**
```bash
git status           # Убедиться что нет незакоммиченных изменений
git fetch origin     # Актуализировать remote
git log -n 3         # Проверить последние коммиты
```

### Шаг 2: Создание Worktree

**Для новой фазы:**
```bash
# Формат: git worktree add <path> <branch-name>
git worktree add ../phase-1-feature feature/phase-1
```

**Структура:**
```
project/
├── .git/
├── src/                 # Main worktree (main branch)
├── ../phase-1-feature/  # Feature worktree
│   ├── src/
│   ├── .git
│   └── ...
```

### Шаг 3: Настройка Окружения

**В каждом worktree:**
```bash
cd ../phase-1-feature
npm install            # Установить зависимости
cp .env.example .env   # Настроить окружение
```

### Шаг 4: Работа в Worktree

**Переключение между worktrees:**
```bash
# Main проект
cd /path/to/project

# Feature worktree
cd /path/to/phase-1-feature
```

**Статус всех worktrees:**
```bash
git worktree list
```

**Вывод:**
```
/path/to/project           main
/path/to/phase-1-feature   feature/phase-1
```

### Шаг 5: Завершение Работы

**После merge:**
```bash
# Удаление worktree
git worktree remove ../phase-1-feature

# Удаление ветки (если нужно)
git branch -d feature/phase-1
```

---

## Интеграция с Unified Workflow

### Шаг 4: ISOLATE

```
1. TASK         → Требования задокументированы
2. BRAINSTORM   → Подходы исследованы
3. PLAN         → Планы готовы
4. ISOLATE      → git worktree add <path> <branch>  ← ЭТОТ ШАГ
5. IMPLEMENT    → TDD в изолированном worktree
6. REVIEW       → Code review
7. VERIFY       → Верификация
8. FINISH       → git merge + worktree remove
9. CLOSE        → Закрытие задачи
```

---

## Команды

| Команда | Описание |
|---------|----------|
| `gsd:using-git-worktrees N` | Создать worktree для фазы N |
| `gsd:isolate-phase N` | Алиас для above |
| `gsd:worktree-list` | Показать все worktrees |
| `gsd:cleanup-worktrees` | Удалить завершённые worktrees |

---

## Best Practices

### ✅ Делать

- Использовать понятные имена веток: `feature/auth`, `fix/issue-123`
- Создавать worktree в соседней папке: `../phase-1-feature`
- Регулярно sync с main: `git fetch origin`
- Удалять worktrees после завершения

### ❌ Не делать

- Не работать в main worktree над фичами
- Не удалять worktree без merge/backup
- Не создавать > 5 активных worktrees одновременно
- Не забывать про `npm install` в новом worktree

---

## Workflow Пример

```bash
# 1. Создание worktree для Phase 1
gsd:using-git-worktrees 1

# Выполняется:
git checkout -b feature/phase-1
git worktree add ../phase-1-feature feature/phase-1

# 2. Переход в worktree
cd ../phase-1-feature

# 3. Установка зависимостей
npm install

# 4. Работа над фичей (TDD цикл)
gsd:execute-phase 1

# 5. Коммит изменений
git add .
git commit -m "Feature: Phase 1 implementation"
git push -u origin feature/phase-1

# 6. Code review + merge (в main проекте)
cd /path/to/project
git checkout main
git merge feature/phase-1
git push

# 7. Очистка
git worktree remove ../phase-1-feature
git branch -d feature/phase-1
```

---

## Мульти-проект Разработка

**Параллельная работа над несколькими фазами:**

```bash
# Phase 1
git worktree add ../phase-1 feature/phase-1

# Phase 2 (параллельно)
git worktree add ../phase-2 feature/phase-2

# Status
git worktree list
# /path/to/project      main
# /path/to/phase-1      feature/phase-1
# /path/to/phase-2      feature/phase-2
```

---

## Troubleshooting

### Ошибка: "already exists"

```bash
# Worktree уже существует
git worktree remove ../phase-1-feature
# или
git worktree prune
```

### Ошибка: "uncommitted changes"

```bash
# Закоммитить или stash изменения
git stash
git worktree add ../phase-1-feature feature/phase-1
git stash pop
```

### Ошибка: "branch is already checked out"

```bash
# Ветка уже используется в другом worktree
# Использовать другую ветку или удалить существующий worktree
git worktree remove <path>
```

---

## После завершения

**Следующая команда:** `gsd:execute-phase N` (в worktree)
