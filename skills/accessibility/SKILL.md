# Accessibility (a11y) Skill

## Description
Web accessibility skill for inclusive design.

## WCAG 2.1 Guidelines
- **Perceivable** - Text alternatives, captions
- **Operable** - Keyboard navigation, focus indicators
- **Understandable** - Clear language, consistent navigation
- **Robust** - Compatible with assistive technologies

## Checklist
```html
<!-- Semantic HTML -->
<main>, <nav>, <article>, <section>

<!-- ARIA labels -->
<button aria-label="Close modal">

<!-- Focus management -->
<button tabIndex={0}>

<!-- Alt text -->
<img alt="Description of image" />
```

## Tools
```bash
# Accessibility audit
npx lighthouse <url> --only-categories=accessibility

# axe-core
npm install -g @axe-core/cli
axe <url>

# ESLint plugin
npm install eslint-plugin-jsx-a11y
```

## Usage
Use this skill for accessibility audits and inclusive design.
