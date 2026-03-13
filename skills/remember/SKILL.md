# Remember Skill

## Description
Быстрое сохранение информации в долгосрочную память PostgreSQL.

## Команды

### Сохранить факт
```bash
# Формат: /remember <сущность>: <факт>
/remember user: Пользователь предпочитает тёмную тему
/remember project_x: Использует стек React + TypeScript + Node.js
/remember preference: Код-стиль — 2 пробела, single quotes
```

### Сохранить связь
```bash
# Формат: /relate <сущность1> -> <сущность2>: <тип связи>
/relate Дмитрий -> project_x: works_on
/relate project_x -> company_y: belongs_to
```

## SQL для вставки

### Добавить сущность и наблюдение
```sql
-- Создать сущность (если нет)
INSERT INTO entities (name, entity_type)
VALUES ('user', 'person')
ON CONFLICT (name) DO NOTHING;

-- Добавить наблюдение
INSERT INTO observations (entity_name, content)
VALUES ('user', 'Текст наблюдения');
```

### Добавить связь
```sql
INSERT INTO relations (from_entity, to_entity, relation_type)
VALUES ('Дмитрий', 'project_x', 'works_on');
```

## Примеры использования

```bash
# Сохранить предпочтение
psql -d mcp_memory -c "INSERT INTO observations (entity_name, content) VALUES ('preference', 'Тёмная тема IDE')"

# Сохранить навык
psql -d mcp_memory -c "INSERT INTO observations (entity_name, content) VALUES ('user', 'Владеет TypeScript')"

# Посмотреть всё о сущности
psql -d mcp_memory -c "SELECT content FROM observations WHERE entity_name = 'user'"
```

## Автоматическая загрузка
Данные загружаются в начале каждой сессии через pre-session.sh
