#!/bin/bash
# Slash command: /load-context
# Загружает контекст в начале сессии

echo "🧠 **Загрузка контекста сессии...**"
echo ""

# Память
echo "📌 **Память:**"
psql -U mac -d mcp_memory -t -c "
SELECT '- ' || e.name || ': ' || string_agg(o.content, ', ')
FROM entities e
JOIN observations o ON e.name = o.entity_name
GROUP BY e.name
ORDER BY e.name;
" 2>/dev/null

echo ""
echo "📚 **Skills:** 28 доступно (git, docker, database, api, files, nodejs, python, react...)"
echo ""
echo "🔌 **MCP:** filesystem, memory, postgres, puppeteer, sequentialthinking, git"
echo ""
echo "---"
echo "**Контекст загружен! Продолжайте работу.**"
