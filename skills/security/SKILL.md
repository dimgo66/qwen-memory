# Security Skill

## Description
Application security skill for secure coding practices.

## Security Checklist
- [ ] Input validation
- [ ] SQL injection prevention
- [ ] XSS protection
- [ ] CSRF tokens
- [ ] Authentication/Authorization
- [ ] Secrets management
- [ ] HTTPS enforcement

## Tools
```bash
# Dependency audit
npm audit
npm audit fix

# Security scanning
npx snyk test
npx eslint --plugin security

# Secret detection
npx gitleaks detect
```

## Best Practices
- Never commit secrets
- Use environment variables
- Hash passwords (bcrypt, argon2)
- Validate all inputs
- Use prepared statements
- Implement rate limiting

## Usage
Use this skill for security reviews, vulnerability fixes, and secure coding.
