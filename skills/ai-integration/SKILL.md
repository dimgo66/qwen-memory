# AI & LLM Integration Skill

## Description
AI and LLM integration for applications.

## Providers
- **OpenAI** - GPT-4, GPT-3.5, embeddings
- **Anthropic** - Claude models
- **Qwen** - Alibaba models
- **Local** - Ollama, LM Studio

## Patterns
```javascript
// Chat completion
const response = await openai.chat.completions.create({
  model: 'gpt-4',
  messages: [{ role: 'user', content: 'Hello' }],
});

// Embeddings
const embedding = await openai.embeddings.create({
  model: 'text-embedding-3-small',
  input: 'Text to embed',
});

// RAG (Retrieval Augmented Generation)
// 1. Store embeddings in vector DB
// 2. Query similar documents
// 3. Include in prompt context
```

## Tools
- **LangChain** - LLM orchestration
- **LlamaIndex** - Data framework
- **Vercel AI SDK** - UI integration
- **Pinecone/Weaviate** - Vector databases

## Usage
Use this skill for AI feature integration and prompt engineering.
