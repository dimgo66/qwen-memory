#!/bin/bash
# Автоматическое обновление ~/.qwen/QWEN.md из базы памяти

QWEN_FILE="$HOME/.qwen/QWEN.md"

# Получаем данные из базы
MEMORY=$(psql -U mac -d mcp_memory -t -A -c "
SELECT '- **' || INITCAP(e.name) || ':** ' || string_agg(o.content, ', ')
FROM entities e
JOIN observations o ON e.name = o.entity_name
GROUP BY e.name
ORDER BY e.name;
" 2>/dev/null)

cat > "$QWEN_FILE" << EOF
# Память Qwen Code

## 👤 Информация о пользователе

$MEMORY

## 📚 Навыки и предпочтения

- Предпочитает русский язык для общения
- Использует macOS

## 🔌 MCP Серверы (подключены)

- \`filesystem\` — файловая система /Users/mac
- \`memory\` — долгосрочная память PostgreSQL
- \`postgres\` — SQL запросы
- \`puppeteer\` — браузерная автоматизация
- \`sequentialthinking\` — структурированное мышление
- \`git\` — Git операции

## 📁 Проекты

### Mister Kamysh
- Backend: Python (FastAPI)
- Frontend: React
- Ports: 8000 (API), 3000 (Frontend)

### Агачер Конкурс
- Сайт: konkurs-minmv
- GitHub: https://github.com/dimgo66/konkurs-minmv

---

*Последнее обновление: $(date '+%d %B %Y')*
EOF

echo "✅ QWEN.md обновлён: $QWEN_FILE"
