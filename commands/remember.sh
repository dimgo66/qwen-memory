#!/bin/bash
# Slash command: /remember
# Сохраняет информацию в базу памяти mcp_memory

if [ -z "$1" ]; then
    echo "❌ Использование: /remember <сущность>: <факт>"
    echo "Пример: /remember user: Пользователь предпочитает тёмную тему"
    exit 1
fi

# Парсим ввод: "сущность: факт"
ENTITY=$(echo "$1" | cut -d':' -f1 | xargs)
CONTENT=$(echo "$1" | cut -d':' -f2- | xargs)

if [ -z "$CONTENT" ]; then
    CONTENT="$ENTITY"
    ENTITY="user"
fi

# Создаём сущность если нет
psql -U mac -d mcp_memory -q -c "
INSERT INTO entities (name, entity_type)
VALUES ('$ENTITY', 'general')
ON CONFLICT (name) DO NOTHING;
" 2>/dev/null

# Добавляем наблюдение
RESULT=$(psql -U mac -d mcp_memory -q -c "
INSERT INTO observations (entity_name, content)
VALUES ('$ENTITY', '$CONTENT')
RETURNING '✅ Сохранено: ' || entity_name || ': ' || content;
" 2>/dev/null)

echo "$RESULT"

# Автоматически обновляем QWEN.md и синхронизируем
/Users/mac/.qwen/update-qwen-md.sh 2>/dev/null

# Автокоммит и пуш (если есть изменения)
cd /Users/mac/.qwen
if git status --porcelain QWEN.md | grep -q .; then
    git add QWEN.md
    git commit -m "Memory update: $CONTENT" --quiet
    git push origin main --quiet 2>/dev/null && echo "🔄 Синхронизировано с GitHub"
fi
