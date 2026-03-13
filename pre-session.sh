#!/bin/bash
# Автоматическая загрузка памяти и skills при старте сессии

echo "🧠 **Память:**"

psql -U mac -d mcp_memory -t -c "
SELECT '📌 ' || e.name || ': ' || string_agg(o.content, ', ')
FROM entities e
JOIN observations o ON e.name = o.entity_name
GROUP BY e.name
ORDER BY e.name;
" 2>/dev/null

echo ""
echo "📚 **Skills:** 28 навыков доступно (git, docker, database, api, files, nodejs, python, react...)"
echo "   Используйте /skills для просмотра или обращайтесь по имени в запросе"
echo ""
echo "🔌 **MCP серверы:** filesystem, memory, postgres, puppeteer, sequentialthinking, git"
echo ""
