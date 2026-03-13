# PostgreSQL Memory Skill

## Description
Long-term memory storage using PostgreSQL database.

## Database Schema
```sql
-- Entities (сущности)
CREATE TABLE entities (
    name TEXT PRIMARY KEY,
    entity_type TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Observations (наблюдения/факты)
CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    entity_name TEXT REFERENCES entities(name),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Relations (связи между сущностями)
CREATE TABLE relations (
    id SERIAL PRIMARY KEY,
    from_entity TEXT REFERENCES entities(name),
    to_entity TEXT REFERENCES entities(name),
    relation_type TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

## Usage Examples

### Save information
```sql
-- Add entity
INSERT INTO entities (name, entity_type) 
VALUES ('project_x', 'project');

-- Add observations
INSERT INTO observations (entity_name, content) 
VALUES ('project_x', 'Uses React and TypeScript');
```

### Query memory
```sql
-- Get all info about entity
SELECT e.name, e.entity_type, o.content 
FROM entities e 
LEFT JOIN observations o ON e.name = o.entity_name 
WHERE e.name = 'user';

-- Search by content
SELECT * FROM observations 
WHERE content ILIKE '%дизайн%';
```

### Add relations
```sql
INSERT INTO relations (from_entity, to_entity, relation_type) 
VALUES ('Дмитрий', 'project_x', 'works_on');
```

## Connection
- **Database:** mcp_memory
- **Host:** localhost (unix socket)
- **User:** mac
- **Port:** 5432

## Commands
```bash
# Connect
psql -d mcp_memory

# List tables
\dt

# Describe table
\d entities
```
