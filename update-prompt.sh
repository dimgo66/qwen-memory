#!/bin/bash
# Обновляет ~/.qwen/PROMPT актуальными данными из памяти

PROMPT_FILE="$HOME/.qwen/PROMPT"

cat > "$PROMPT_FILE" << 'EOF'
# Qwen Code Session Context
# Автозагрузка в начале каждой сессии

## 🧠 Память пользователя
EOF

# Добавляем данные из базы
psql -U mac -d mcp_memory -t -c "
SELECT '- **' || e.name || ':** ' || string_agg(o.content, ', ')
FROM entities e
JOIN observations o ON e.name = o.entity_name
GROUP BY e.name
ORDER BY e.name;
" 2>/dev/null >> "$PROMPT_FILE"

cat >> "$PROMPT_FILE" << 'EOF'

## 📚 Доступные Skills (28)
git, docker, database, api, files, nodejs, python, react, typescript, backend, frontend, fullstack, devops, cloud, testing, design, accessibility, responsive, performance, security, ai-integration, graphql, microservices, webscraping, memory, postgres-memory, thinking, remember

## 🔌 MCP Серверы (подключены)
- filesystem — доступ к файлам /Users/mac
- memory — долгосрочная память PostgreSQL
- postgres — SQL запросы к базе
- puppeteer — браузерная автоматизация
- sequentialthinking — структурированное мышление
- git — Git операции

## 🛠️ Быстрые команды
- `/memory` — показать сохранённые данные
- `/remember <факт>` — сохранить в память
- `/skills` — список навыков

---
**Важно:** Используй эту информацию в каждой сессии. Загружай память через MCP memory сервер.
EOF

echo "✅ PROMPT обновлён: $PROMPT_FILE"
