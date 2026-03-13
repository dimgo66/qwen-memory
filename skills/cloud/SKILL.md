# Cloud & Serverless Skill

## Description
Cloud platforms and serverless development.

## AWS Services
```
Compute:      Lambda, EC2, ECS
Storage:      S3, EFS, DynamoDB
Database:     RDS, Aurora, DynamoDB
API:          API Gateway, AppSync
Auth:         Cognito, IAM
Monitoring:   CloudWatch, X-Ray
```

## Serverless Patterns
```javascript
// AWS Lambda handler
export const handler = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'Hello' }),
  };
};
```

## Infrastructure as Code
```yaml
# Serverless Framework
service: my-api
provider: aws
functions:
  hello:
    handler: handler.hello
    events:
      - http: GET /hello
```

## Platforms
- **AWS** - Amazon Web Services
- **Vercel** - Frontend cloud
- **Railway** - Fullstack hosting
- **Supabase** - Backend as a Service

## Usage
Use this skill for cloud architecture and serverless development.
