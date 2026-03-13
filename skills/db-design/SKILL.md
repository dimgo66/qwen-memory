# Database Design Skill

## Description
Database schema design and optimization skill.

## SQL Design Patterns
```sql
-- Normalized schema
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  content TEXT,
  published BOOLEAN DEFAULT false
);

-- Indexes
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_published ON posts(published);
```

## Concepts
- **Normalization** - 1NF, 2NF, 3NF
- **Indexes** - B-tree, Hash, GIN
- **Relationships** - One-to-one, One-to-many, Many-to-many
- **Transactions** - ACID compliance
- **Migrations** - Schema versioning

## ORMs
- **Prisma** - Type-safe ORM
- **TypeORM** - Decorator-based
- **Sequelize** - Promise-based
- **Drizzle** - SQL-like

## Usage
Use this skill for designing efficient database schemas.
Consider query patterns, indexing strategy, and scalability.
