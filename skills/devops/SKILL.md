# DevOps & Deployment Skill

## Description
Deployment, CI/CD, and infrastructure skill for web applications.

## Docker
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

## Docker Compose
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgres://...
  db:
    image: postgres:15
    environment:
      - POSTGRES_PASSWORD=secret
```

## CI/CD (GitHub Actions)
- Automated testing
- Build pipelines
- Deployment workflows
- Environment management

## Hosting Platforms
- **Vercel** - Frontend/Next.js
- **Railway** - Fullstack
- **Fly.io** - Docker apps
- **AWS** - Enterprise

## Usage
Use this skill for containerization, CI/CD setup, and deployment.
Follow infrastructure-as-code principles.
