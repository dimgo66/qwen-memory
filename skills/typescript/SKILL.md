# TypeScript Skill

## Description
TypeScript development skill for type-safe JavaScript applications.

## Core Features
- **Static Types** - Interfaces, Types, Generics
- **Type Inference** - Automatic type detection
- **Union Types** - `string | number`
- **Generics** - Reusable type-safe code
- **Utility Types** - Partial, Pick, Omit, Record

## Patterns
```typescript
interface User {
  id: number;
  name: string;
  email?: string;
}

type ApiResponse<T> = {
  data: T;
  status: number;
  error?: string;
};

function fetchUser(id: number): Promise<ApiResponse<User>> {
  // implementation
}
```

## Config (tsconfig.json)
- strict: true
- esModuleInterop: true
- skipLibCheck: true
- moduleResolution: bundler

## Usage
Use this skill for type-safe development in TypeScript.
Prefer interfaces for objects, types for unions.
