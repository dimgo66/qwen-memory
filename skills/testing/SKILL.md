# Testing Skill

## Description
Testing and QA skill for unit, integration, and e2e tests.

## Testing Frameworks
```javascript
// Jest
describe('Component', () => {
  it('should render', () => {
    expect(component).toBeTruthy();
  });
});

// Vitest
import { test, expect } from 'vitest';

// Playwright (E2E)
test('page load', async ({ page }) => {
  await page.goto('/');
  await expect(page).toHaveTitle(/Home/);
});
```

## Commands
```bash
# Run tests
npm test
npm run test:watch
npm run test:coverage

# E2E
npm run e2e
npx playwright test

# Linting
npm run lint
npm run lint:fix
```

## Best Practices
- AAA pattern: Arrange, Act, Assert
- Test isolation
- Mocking external dependencies
- Coverage > 80%

## Usage
Use this skill for writing and running tests, debugging failures.
