# Qwen CLI Automation

Автоматизация задач через Qwen Code CLI для CI/CD и GSD воркфлоу.

---

## Использование

```bash
qwen -p "ваша задача"
```

---

## Примеры использования

### 🔧 Code Quality

```bash
# ESLint на изменённые файлы
qwen -p "Run eslint --fix on all changed files and commit"

# Prettier форматирование
qwen -p "Run prettier --write on src/ directory"

# TypeScript проверка
qwen -p "Run tsc --noEmit and fix type errors"
```

### 📝 Code Review

```bash
# Review конкретного PR
qwen -p "Review PR #123 and post summary comments"

# Review всех открытых PR
qwen -p "Review all open PRs and create summary report"

# Code review с фокусом на безопасность
qwen -p "Review PR #123 for security vulnerabilities"
```

### 🚀 GSD Workflow

```bash
# Анализ кодовой базы
qwen -p "Execute gsd:map-codebase phase and save results to .qwen/gsd/"

# Планирование фазы
qwen -p "Execute gsd:plan-phase 1 and update ROADMAP.md"

# Отчёт о прогрессе
qwen -p "Run gsd:progress and generate status report"

# Полная инициализация проекта
qwen -p "Execute gsd:new-project with auto mode"
```

### 📊 Documentation

```bash
# Генерация документации
qwen -p "Generate API documentation from src/ files"

# Обновление README
qwen -p "Update README.md with current project structure"

# Changelog
qwen -p "Generate changelog from git commits since last tag"
```

### 🧪 Testing

```bash
# Запуск тестов
qwen -p "Run npm test and fix failing tests"

# Coverage отчёт
qwen -p "Run test coverage and generate report"

# Snapshot тесты
qwen -p "Update snapshot tests for changed components"
```

### 🔄 CI/CD

```bash
# Pre-commit проверка
qwen -p "Run lint, type-check, and test before commit"

# Build verification
qwen -p "Run npm run build and verify output"

# Deployment check
qwen -p "Verify deployment configuration and run pre-deploy checks"
```

---

## GSD Automation Scripts

### Project Initialization

```bash
# Новый проект
qwen -p "gsd:new-project --auto"

# Анализ существующего
qwen -p "gsd:map-codebase --area frontend"

# Полная инициализация
qwen -p "gsd:new-project && gsd:discuss-phase 1 --analyze && gsd:plan-phase 1"
```

### Phase Execution

```bash
# Выполнение фазы
qwen -p "gsd:execute-phase 1"

# Верификация
qwen -p "gsd:verify-work 1"

# Ship
qwen -p "gsd:ship 1"
```

### Status & Reports

```bash
# Прогресс
qwen -p "gsd:progress --json > status.json"

# Статистика
qwen -p "gsd:stats --verbose > project-stats.md"

# Health check
qwen -p "gsd:health --repair"
```

---

## CI/CD Integration

### GitHub Actions

```yaml
name: Qwen Code Quality

on: [push, pull_request]

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run ESLint
        run: qwen -p "Run eslint --fix on all changed files"
      
      - name: Run tests
        run: qwen -p "Run npm test and fix failing tests"
      
      - name: Build verification
        run: qwen -p "Run npm run build and verify output"
```

### GitLab CI

```yaml
stages:
  - quality
  - build
  - deploy

quality:
  stage: quality
  script:
    - qwen -p "Run eslint --fix on all changed files and commit"
    - qwen -p "Run npm test"

build:
  stage: build
  script:
    - qwen -p "Run npm run build and verify output"

deploy:
  stage: deploy
  script:
    - qwen -p "Execute deployment checks and deploy"
  only:
    - main
```

---

## Custom Automation Scripts

### Pre-commit Hook

```bash
#!/bin/bash
# .git/hooks/pre-commit

echo "Running pre-commit checks..."

qwen -p "Run eslint on staged files"
if [ $? -ne 0 ]; then
  echo "ESLint failed!"
  exit 1
fi

qwen -p "Run tsc --noEmit"
if [ $? -ne 0 ]; then
  echo "TypeScript check failed!"
  exit 1
fi

echo "All checks passed!"
exit 0
```

### Automated PR Review

```bash
#!/bin/bash
# scripts/review-pr.sh

PR_NUMBER=$1

if [ -z "$PR_NUMBER" ]; then
  echo "Usage: ./review-pr.sh <pr-number>"
  exit 1
fi

echo "Reviewing PR #$PR_NUMBER..."

qwen -p "Review PR #$PR_NUMBER and post summary comments"

echo "Review complete!"
```

### GSD Daily Standup

```bash
#!/bin/bash
# scripts/daily-standup.sh

echo "Generating daily standup report..."

qwen -p "gsd:progress --brief"
qwen -p "gsd:stats --brief"

echo "Report generated!"
```

---

## Best Practices

### 1. Используйте конкретные задачи

✅ **Хорошо:**
```bash
qwen -p "Run eslint --fix on src/components/ and commit"
```

❌ **Плохо:**
```bash
qwen -p "Fix code"
```

### 2. Комбинируйте задачи

```bash
qwen -p "Run lint, test, and build verification"
```

### 3. Сохраняйте результаты

```bash
qwen -p "gsd:stats --json" > stats-$(date +%Y-%m-%d).json
```

### 4. Автоматизируйте рутину

```bash
# .git/hooks/pre-push
qwen -p "Run pre-push checks: lint, test, build"
```

---

## Environment Variables

```bash
# GitHub token для PR review
export GITHUB_TOKEN=your_token_here

# Vercel token для деплоя
export VERCEL_TOKEN=your_token_here

# Database connection
export DATABASE_URL=postgresql://...
```

---

## Troubleshooting

### Qwen CLI not found
```bash
npm install -g qwen-code
```

### Permission denied
```bash
chmod +x scripts/*.sh
```

### Task timeout
```bash
# Увеличить таймаут
qwen -p "long running task" --timeout 300000
```

---

## Версия

**Документ:** v1.0  
**Обновлено:** 27 марта 2026
