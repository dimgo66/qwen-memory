#!/bin/bash
# Slash command: /memory
# Показывает сохранённые данные из памяти

echo "🧠 **Память**\n"

# Сущности и наблюдения
psql -U mac -d mcp_memory -t -c "
SELECT '📌 ' || e.name || ': ' || string_agg(o.content, E'\n   ')
FROM entities e
JOIN observations o ON e.name = o.entity_name
GROUP BY e.name
ORDER BY e.name;
" 2>/dev/null

echo ""

# Связи
RELATIONS=$(psql -U mac -d mcp_memory -t -c "
SELECT '🔗 ' || from_entity || ' -> ' || to_entity || ' (' || relation_type || ')'
FROM relations
ORDER BY created_at DESC
LIMIT 10;
" 2>/dev/null)

if [ -n "$RELATIONS" ]; then
    echo "**Связи:**"
    echo "$RELATIONS"
fi
