# Database Skill

## Description
Database operations skill for PostgreSQL and MySQL.

## Commands
```bash
# PostgreSQL
psql -U <user> -d <database>
psql -h localhost -U <user> -d <database>

# MySQL
mysql -u <user> -p <database>

# Common SQL
SHOW DATABASES;
USE <database>;
SHOW TABLES;
DESCRIBE <table>;
SELECT * FROM <table> LIMIT 10;
```

## Environment
- PostgreSQL default: localhost:5432
- MySQL default: localhost:3306

## Usage
Use this skill for database connections, queries, and schema management.
Always backup before destructive operations.
