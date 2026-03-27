---
name: deploy-vercel
description: Deploy current project to Vercel with proper checks
---

# Steps

1. **Check Configuration**
   - Check for `vercel.json` in project root
   - Verify `package.json` has required scripts (`build`, `dev`)
   - Check for `.env` files if needed

2. **Local Build Test**
   ```bash
   npm run build
   # or
   yarn build
   # or
   pnpm build
   ```
   - Fix any build errors before proceeding
   - Verify build output directory exists

3. **Pre-Deployment Checks**
   - Ensure Vercel CLI is installed: `vercel --version`
   - Check if project is linked: `vercel link`
   - Verify environment variables are set

4. **Deploy to Production**
   ```bash
   vercel --prod
   ```
   - Wait for deployment to complete
   - Note the deployment URL

5. **Verify Deployment**
   - Open deployment URL in browser
   - Check main page loads
   - Verify critical functionality works
   - Check for console errors

# Edge Cases

## If vercel.json missing
Create basic config:
```json
{
  "version": 2,
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install"
}
```

## If build fails
1. Show specific error message
2. Identify the root cause:
   - Missing dependencies? → `npm install`
   - TypeScript errors? → Fix type issues
   - Path issues? → Check imports
3. Fix the error
4. Retry build: `npm run build`

## If Vercel CLI not installed
```bash
npm install -g vercel
```

## If project not linked
```bash
vercel link
# or create new project
vercel
```

## If environment variables missing
1. Check `.env.example` for required vars
2. Add to Vercel project settings:
   ```bash
   vercel env add VARIABLE_NAME
   ```
3. Or create local `.env` file

# Notes

- Always test build locally before deploying
- For Vue projects: ensure dist/ is created
- For Next.js: verify .next/ output
- Check port conflicts (Vercel uses 3000 by default)
- Hard refresh browser after deployment (Cmd+Shift+R)
