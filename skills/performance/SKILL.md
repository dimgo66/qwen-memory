# Performance Optimization Skill

## Description
Web performance optimization skill.

## Metrics (Core Web Vitals)
- **LCP** < 2.5s - Largest Contentful Paint
- **FID** < 100ms - First Input Delay
- **CLS** < 0.1 - Cumulative Layout Shift

## Optimization Techniques
```javascript
// Code splitting
const LazyComponent = lazy(() => import('./HeavyComponent'));

// Image optimization
<img loading="lazy" src="image.webp" />

// Memoization
const memoized = useMemo(() => expensive(), [deps]);
```

## Tools
```bash
# Lighthouse
npx lighthouse <url>

# Bundle analysis
npm run build -- --stats
npx webpack-bundle-analyzer

# Performance monitoring
npx @web-vitals/cli
```

## Best Practices
- Minimize bundle size
- Use CDN for assets
- Enable caching
- Optimize images (WebP, AVIF)
- Lazy load components

## Usage
Use this skill for performance audits and optimization.
