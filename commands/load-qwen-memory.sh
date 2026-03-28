#!/bin/bash
# GSD Load Context Command
# Загружает QWEN.md память в текущую сессию

echo "📚 Загрузка памяти Qwen Code..."

if [ -f "$HOME/.qwen/QWEN.md" ]; then
    echo "✓ QWEN.md найден"
    echo ""
    echo "Для загрузки памяти в сессии Qwen Code:"
    echo ""
    echo "1. Откройте Qwen Code"
    echo "2. Напишите:"
    echo "   'Загрузи мою память из ~/.qwen/QWEN.md'"
    echo ""
    echo "Или используйте команду:"
    echo "   /gsd:help"
    echo ""
    echo "📄 Содержимое QWEN.md:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    cat "$HOME/.qwen/QWEN.md"
else
    echo "✗ QWEN.md не найден в $HOME/.qwen/"
    exit 1
fi
