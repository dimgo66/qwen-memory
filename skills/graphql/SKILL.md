# GraphQL Skill

## Description
GraphQL API development skill.

## Schema Design
```graphql
type Query {
  user(id: ID!): User
  posts(limit: Int = 10): [Post!]!
}

type Mutation {
  createUser(input: CreateUserInput!): User!
  updateUser(id: ID!, input: UpdateUserInput!): User
}

type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post!]!
}
```

## Resolvers
```javascript
const resolvers = {
  Query: {
    user: (_, { id }, { db }) => db.user.find(id),
  },
  Mutation: {
    createUser: (_, { input }, { db }) => db.user.create(input),
  },
};
```

## Tools
- **Apollo Server/Client** - GraphQL server
- **Relay** - Facebook's GraphQL client
- **Urql** - Lightweight GraphQL client
- **GraphiQL** - GraphQL IDE

## Usage
Use this skill for GraphQL schema design, resolvers, and queries.
