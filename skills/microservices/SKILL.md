# Microservices Skill

## Description
Microservices architecture and design patterns.

## Patterns
- **API Gateway** - Single entry point
- **Service Discovery** - Locate services
- **Circuit Breaker** - Fault tolerance
- **Event Sourcing** - State changes as events
- **CQRS** - Separate read/write models

## Communication
```
REST API      - HTTP/JSON, simple
gRPC          - HTTP/2, fast, typed
Message Queue - Async, reliable (RabbitMQ, Kafka)
```

## Docker Compose
```yaml
services:
  api-gateway:
    build: ./gateway
    ports: ["8080:8080"]
  user-service:
    build: ./users
  order-service:
    build: ./orders
```

## Tools
- **Docker/Kubernetes** - Orchestration
- **Prometheus/Grafana** - Monitoring
- **Jaeger** - Distributed tracing
- **Kong/Traefik** - API Gateway

## Usage
Use this skill for microservices design and implementation.
