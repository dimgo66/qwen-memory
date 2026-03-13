# API Skill

## Description
HTTP API requests skill for testing and interacting with REST/GraphQL APIs.

## Commands
```bash
# GET request
curl -X GET <url>

# POST request
curl -X POST <url> -H "Content-Type: application/json" -d '{"key":"value"}'

# With auth
curl -X GET <url> -H "Authorization: Bearer <token>"

# Using httpie (if installed)
http GET <url>
http POST <url> key=value

# Using jq for JSON parsing
curl <url> | jq '.key'
```

## Tools
- curl (always available)
- httpie (optional, prettier output)
- jq (JSON parsing)

## Usage
Use this skill for API testing, webhook calls, and HTTP request debugging.
