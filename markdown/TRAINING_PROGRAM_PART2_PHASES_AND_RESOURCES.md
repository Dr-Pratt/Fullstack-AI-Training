# Full Stack AI Engineer Training Program - Part 2
## Remaining Phases, Resources, and Implementation Guides

This document continues from the main training program and provides:
- Phases 2-7 (condensed but complete)
- AI Prompting Master Guide
- Success Metrics Framework
- Interview Preparation
- Comprehensive Resource Appendix

---

# PHASE 2: Node.js & Python Backend Development (Weeks 5-6)

## 🎯 Phase Overview

**Goal**: Master two additional backend stacks (Node.js and Python) to become truly full-stack polyglot engineer.

**Time Allocation**: 80-100 hours over 2 weeks
- Node.js fundamentals & Express: 20 hours
- NestJS framework: 15 hours
- Python fundamentals & FastAPI: 20 hours
- Database integration (both stacks): 15 hours
- Project: Multi-stack comparison API: 25 hours

---

## Node.js & Express.js

### Learning Path

**Week 5 Day 1-3: Node.js Fundamentals**

**AI Prompt for Learning**:
```
Context: I'm a Java developer (Spring Boot expert) learning Node.js.

Explain Node.js concepts with Java comparisons:
1. Event Loop vs Java threading model
2. Async/await vs CompletableFuture
3. npm vs Maven
4. package.json vs pom.xml
5. CommonJS/ES Modules vs Java packages
6. Express.js vs Spring MVC

Provide:
- Side-by-side code examples
- Best practices for Node.js coming from Java
- Common pitfalls Java developers face in Node.js
- Banking API example in both stacks
```

**Quick Start Project**: Payment Webhook Service (Express.js)

```javascript
// package.json
{
  "name": "payment-webhook-service",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "nodemon src/index.js",
    "start": "node src/index.js",
    "test": "jest"
  },
  "dependencies": {
    "express": "^4.18.2",
    "dotenv": "^16.3.1",
    "pg": "^8.11.3",
    "joi": "^17.11.0",
    "morgan": "^1.10.0",
    "helmet": "^7.1.0",
    "express-rate-limit": "^7.1.5"
  },
  "devDependencies": {
    "nodemon": "^3.0.2",
    "jest": "^29.7.0",
    "supertest": "^6.3.3"
  }
}
```

```javascript
// src/index.js
import express from 'express';
import helmet from 'helmet';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import dotenv from 'dotenv';
import webhookRoutes from './routes/webhook.routes.js';
import errorHandler from './middleware/error.middleware.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(helmet());  // Security headers
app.use(morgan('combined'));  // Logging
app.use(express.json());  // Parse JSON bodies

// Rate limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,  // 15 minutes
  max: 100  // limit each IP to 100 requests per windowMs
});
app.use('/api/', limiter);

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

// Routes
app.use('/api/v1/webhooks', webhookRoutes);

// Error handling
app.use(errorHandler);

// Start server
app.listen(PORT, () => {
  console.log(`Payment Webhook Service running on port ${PORT}`);
});

export default app;
```

```javascript
// src/routes/webhook.routes.js
import express from 'express';
import {
  handlePaymentWebhook,
  getWebhookLogs
} from '../controllers/webhook.controller.js';
import { validateWebhook } from '../middleware/validation.middleware.js';

const router = express.Router();

router.post('/payment', validateWebhook, handlePaymentWebhook);
router.get('/logs', getWebhookLogs);

export default router;
```

```javascript
// src/controllers/webhook.controller.js
import { processPaymentEvent } from '../services/webhook.service.js';
import logger from '../utils/logger.js';

export const handlePaymentWebhook = async (req, res, next) => {
  try {
    const { event_type, payment_data } = req.body;

    logger.info(`Received webhook: ${event_type}`, { payment_data });

    // Process webhook asynchronously
    await processPaymentEvent(event_type, payment_data);

    // Acknowledge immediately (important for webhooks)
    res.status(200).json({
      received: true,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    next(error);
  }
};

export const getWebhookLogs = async (req, res, next) => {
  try {
    // Implementation for fetching logs
    const logs = []; // Fetch from database
    res.json({ logs });
  } catch (error) {
    next(error);
  }
};
```

**Checklist: Node.js Fundamentals**
- [ ] Understand event loop and async/await
- [ ] Set up Express.js project with ES modules
- [ ] Implement REST API with middleware
- [ ] Add request validation (Joi or Zod)
- [ ] Implement error handling
- [ ] Add logging (Winston or Pino)
- [ ] Connect to PostgreSQL
- [ ] Write unit tests with Jest
- [ ] Write integration tests with Supertest

---

### NestJS (Enterprise Node.js)

**Why NestJS?**: Most similar to Spring Boot - uses decorators, dependency injection, modular architecture.

**Week 5 Day 4-5: NestJS**

**AI Prompt**:
```
I know Spring Boot very well. Help me learn NestJS:

Compare:
1. @RestController → @Controller in NestJS
2. @Service → @Injectable in NestJS
3. @Autowired → Constructor injection in NestJS
4. application.yml → Environment variables in NestJS
5. Spring modules → NestJS modules

Create a banking transaction API in NestJS with:
- Module structure
- Controller, Service, Repository pattern
- DTOs with class-validator
- PostgreSQL integration with TypeORM
- JWT authentication
- Exception filters
- Interceptors for logging
- Swagger API documentation
```

**Quick Project**: Transaction Service (NestJS)

```bash
# Install NestJS CLI
npm install -g @nestjs/cli

# Create project
nest new transaction-service

# Add dependencies
npm install @nestjs/typeorm typeorm pg
npm install @nestjs/config
npm install class-validator class-transformer
npm install @nestjs/swagger swagger-ui-express
```

**Success Criteria**:
- [ ] NestJS project created with modules
- [ ] TypeORM configured with PostgreSQL
- [ ] DTOs with validation decorators
- [ ] Exception filters for error handling
- [ ] Swagger documentation auto-generated
- [ ] Unit tests with Jest
- [ ] E2E tests with Supertest

---

## Python & FastAPI

### Learning Path

**Week 6 Day 1-3: Python for Backend**

**AI Prompt**:
```
I'm a Java developer learning Python for backend development.

Explain with Java comparisons:
1. Python data types vs Java types
2. Lists/Dicts vs Java Collections
3. Python classes vs Java classes
4. Type hints (Python 3.10+) vs Java strong typing
5. Virtual environments vs Maven dependencies
6. pip/requirements.txt vs Maven pom.xml

Then teach FastAPI:
- FastAPI vs Spring Boot comparison
- Path operations vs @GetMapping
- Dependency injection in FastAPI
- Pydantic models vs Java DTOs
- Async endpoints
- Database integration (SQLAlchemy)

Provide a fraud detection API example in FastAPI that:
- Accepts transaction data
- Validates with Pydantic
- Stores in PostgreSQL
- Returns fraud score
- Uses async/await
```

**Quick Project**: Fraud Detection API (FastAPI)

```python
# requirements.txt
fastapi==0.109.0
uvicorn[standard]==0.27.0
pydantic==2.5.3
pydantic-settings==2.1.0
sqlalchemy==2.0.25
psycopg2-binary==2.9.9
python-jose[cryptography]==3.3.0
passlib[bcrypt]==1.7.4
python-multipart==0.0.6
```

```python
# main.py
from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
from database import engine, Base
from routers import fraud_router, transaction_router

# Create tables on startup
@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    Base.metadata.create_all(bind=engine)
    yield
    # Shutdown
    pass

app = FastAPI(
    title="Fraud Detection API",
    description="AI-powered fraud detection for banking transactions",
    version="1.0.0",
    lifespan=lifespan
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Health check
@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "fraud-detection"}

# Include routers
app.include_router(fraud_router, prefix="/api/v1/fraud", tags=["Fraud Detection"])
app.include_router(transaction_router, prefix="/api/v1/transactions", tags=["Transactions"])

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
```

```python
# schemas.py (Pydantic models)
from pydantic import BaseModel, Field, validator
from datetime import datetime
from decimal import Decimal
from typing import Optional

class TransactionBase(BaseModel):
    amount: Decimal = Field(..., gt=0, description="Transaction amount")
    currency: str = Field(..., min_length=3, max_length=3)
    merchant_id: str
    customer_id: str
    transaction_type: str

    @validator('currency')
    def currency_must_be_uppercase(cls, v):
        return v.upper()

class TransactionCreate(TransactionBase):
    pass

class TransactionResponse(TransactionBase):
    id: int
    fraud_score: float = Field(..., ge=0, le=100)
    is_fraudulent: bool
    created_at: datetime

    class Config:
        from_attributes = True  # Pydantic V2 (was orm_mode in V1)

class FraudAnalysisRequest(BaseModel):
    transaction_id: int

class FraudAnalysisResponse(BaseModel):
    transaction_id: int
    fraud_score: float
    risk_factors: list[str]
    recommendation: str  # APPROVE, REVIEW, REJECT
```

```python
# routers/fraud.py
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from schemas import TransactionCreate, TransactionResponse, FraudAnalysisResponse
from services.fraud_service import analyze_transaction
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.post("/analyze", response_model=FraudAnalysisResponse)
async def analyze_for_fraud(
    transaction: TransactionCreate,
    db: Session = Depends(get_db)
):
    """
    Analyze a transaction for fraud indicators.
    Returns fraud score and risk assessment.
    """
    try:
        logger.info(f"Analyzing transaction for customer: {transaction.customer_id}")

        # Perform fraud analysis (would use AI model here)
        result = await analyze_transaction(transaction, db)

        return result
    except Exception as e:
        logger.error(f"Fraud analysis failed: {str(e)}")
        raise HTTPException(status_code=500, detail="Fraud analysis failed")
```

**Checklist: Python/FastAPI**
- [ ] Understand Python async/await
- [ ] Set up FastAPI project
- [ ] Create Pydantic models with validation
- [ ] Implement dependency injection
- [ ] SQLAlchemy ORM setup
- [ ] Automatic API documentation (Swagger)
- [ ] Error handling with HTTPException
- [ ] Unit tests with pytest
- [ ] Async endpoint testing

---

## Week 5-6 Major Project: Multi-Stack API Gateway

### Project Brief
Build an API Gateway that routes requests to different microservices built in Java, Node.js, and Python.

**Architecture**:
```
API Gateway (Node.js/Express)
    ├── Account Service (Java/Spring Boot) - Port 8081
    ├── Transaction Service (Node.js/NestJS) - Port 3001
    └── Fraud Detection (Python/FastAPI) - Port 8000
```

**Features**:
- Reverse proxy to route requests
- Request/response logging
- Rate limiting per service
- Circuit breaker pattern
- Service health checks
- Centralized error handling
- JWT authentication validation

**Success Metrics**:
- [ ] All 4 services running locally
- [ ] Gateway correctly routes to each service
- [ ] End-to-end flow: Create account → Process transaction → Check fraud
- [ ] Comprehensive tests for each service
- [ ] Docker Compose for one-command startup
- [ ] Complete API documentation
- [ ] Deployed to Railway/Render

**Time Estimate**: 25-30 hours

---

# PHASE 3: Frontend Development & Databases (Weeks 7-8)

## 🎯 Phase Overview

**Goal**: Master modern frontend development with React/Next.js and understand various database paradigms.

**Time Allocation**: 80-100 hours over 2 weeks
- React fundamentals: 15 hours
- TypeScript: 10 hours
- Next.js & App Router: 15 hours
- Tailwind CSS & UI libraries: 10 hours
- PostgreSQL advanced: 10 hours
- MongoDB & NoSQL: 10 hours
- Redis & caching: 8 hours
- Major project (Banking Dashboard): 30 hours

---

## React & TypeScript

### Learning Path

**AI Prompt for React (Java Developer Perspective)**:
```
I'm a backend Java developer learning React.

Explain React concepts with backend analogies:
1. Components vs Java classes
2. Props vs method parameters
3. State vs instance variables
4. useEffect vs lifecycle methods
5. Context API vs Dependency Injection
6. React hooks vs design patterns

Then explain:
- Functional vs class components (use functional)
- Common hooks: useState, useEffect, useContext, useReducer
- Component composition
- Data flow (props down, events up)
- Form handling and validation
- API integration with fetch/axios
- Error boundaries

Build a banking transaction list component that:
- Fetches transactions from API
- Displays in table with sorting/filtering
- Shows loading state
- Handles errors gracefully
- Pagination
- TypeScript for type safety
```

**Quick Project**: Transaction Dashboard (React + TypeScript)

```bash
# Create React app with TypeScript
npx create-react-app transaction-dashboard --template typescript

# Or use Vite (faster, modern)
npm create vite@latest transaction-dashboard -- --template react-ts
cd transaction-dashboard
npm install

# Install dependencies
npm install axios date-fns
npm install @tanstack/react-query  # For data fetching
npm install react-router-dom  # For routing
```

**Key Concepts with Code**:

```tsx
// src/types/transaction.ts
export interface Transaction {
  id: string;
  amount: number;
  currency: string;
  merchant: string;
  timestamp: string;
  status: 'pending' | 'approved' | 'rejected';
  fraudScore?: number;
}

export interface TransactionFilters {
  status?: string;
  minAmount?: number;
  maxAmount?: number;
  dateFrom?: string;
  dateTo?: string;
}
```

```tsx
// src/hooks/useTransactions.ts
import { useState, useEffect } from 'react';
import axios from 'axios';
import { Transaction } from '../types/transaction';

export const useTransactions = () => {
  const [transactions, setTransactions] = useState<Transaction[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchTransactions = async () => {
      try {
        setLoading(true);
        const response = await axios.get<Transaction[]>('/api/v1/transactions');
        setTransactions(response.data);
        setError(null);
      } catch (err) {
        setError('Failed to load transactions');
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchTransactions();
  }, []);

  return { transactions, loading, error };
};
```

```tsx
// src/components/TransactionList.tsx
import React from 'react';
import { useTransactions } from '../hooks/useTransactions';
import { Transaction } from '../types/transaction';

export const TransactionList: React.FC = () => {
  const { transactions, loading, error } = useTransactions();

  if (loading) {
    return <div className="loading">Loading transactions...</div>;
  }

  if (error) {
    return <div className="error">{error}</div>;
  }

  return (
    <div className="transaction-list">
      <h2>Transactions</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Amount</th>
            <th>Merchant</th>
            <th>Status</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          {transactions.map((transaction) => (
            <TransactionRow key={transaction.id} transaction={transaction} />
          ))}
        </tbody>
      </table>
    </div>
  );
};

interface TransactionRowProps {
  transaction: Transaction;
}

const TransactionRow: React.FC<TransactionRowProps> = ({ transaction }) => {
  const statusColor = {
    approved: 'green',
    pending: 'orange',
    rejected: 'red'
  }[transaction.status];

  return (
    <tr>
      <td>{transaction.id}</td>
      <td>${transaction.amount.toFixed(2)} {transaction.currency}</td>
      <td>{transaction.merchant}</td>
      <td style={{ color: statusColor }}>{transaction.status}</td>
      <td>{new Date(transaction.timestamp).toLocaleDateString()}</td>
    </tr>
  );
};
```

**Checklist: React Fundamentals**
- [ ] Understand component lifecycle
- [ ] Use functional components with hooks
- [ ] Implement useState for local state
- [ ] Implement useEffect for side effects
- [ ] Create custom hooks for reusability
- [ ] TypeScript interfaces for props
- [ ] Form handling with controlled components
- [ ] API integration with axios or fetch
- [ ] Error handling and loading states
- [ ] Component composition and props drilling

---

## Next.js 14 (Production React)

**Why Next.js?**: Server-side rendering, file-based routing, API routes, optimized builds, SEO-friendly.

**AI Prompt**:
```
Explain Next.js 14 App Router to someone who knows React:

1. App Router vs Pages Router (use App Router)
2. Server Components vs Client Components
3. File-based routing (app directory)
4. Layouts and templates
5. Data fetching (server-side vs client-side)
6. API routes in Next.js
7. Metadata and SEO
8. Image optimization
9. Deployment to Vercel

Build a banking dashboard with Next.js that includes:
- Authentication (NextAuth.js)
- Server-side data fetching for account balance
- Client-side interactivity for transactions
- API routes for backend calls
- Optimized images and fonts
- SEO metadata
- Responsive design with Tailwind
```

**Quick Start**:
```bash
npx create-next-app@latest banking-dashboard
# Choose:
# - TypeScript: Yes
# - ESLint: Yes
# - Tailwind CSS: Yes
# - src/ directory: Yes
# - App Router: Yes
# - Import alias: Yes (@/*)

cd banking-dashboard
npm run dev
```

**Project Structure**:
```
banking-dashboard/
├── src/
│   ├── app/
│   │   ├── layout.tsx              # Root layout
│   │   ├── page.tsx                # Home page
│   │   ├── dashboard/
│   │   │   ├── layout.tsx          # Dashboard layout
│   │   │   ├── page.tsx            # Dashboard home
│   │   │   ├── accounts/
│   │   │   │   └── page.tsx        # Accounts page
│   │   │   └── transactions/
│   │   │       └── page.tsx        # Transactions page
│   │   └── api/
│   │       ├── accounts/
│   │       │   └── route.ts        # API route
│   │       └── transactions/
│   │           └── route.ts
│   ├── components/
│   │   ├── ui/                     # shadcn/ui components
│   │   ├── AccountCard.tsx
│   │   └── TransactionTable.tsx
│   ├── lib/
│   │   ├── api.ts                  # API client
│   │   └── utils.ts
│   └── types/
│       └── index.ts
├── public/
├── tailwind.config.ts
└── package.json
```

**Checklist: Next.js**
- [ ] Understand Server vs Client Components
- [ ] File-based routing mastery
- [ ] Data fetching patterns (server & client)
- [ ] API routes implementation
- [ ] Layouts and nested layouts
- [ ] SEO with metadata
- [ ] Image optimization
- [ ] Deployed to Vercel
- [ ] Environment variables configuration

---

## Databases Deep Dive

### PostgreSQL Advanced

**Topics to Master**:
- Indexes and query optimization
- Transactions and ACID properties
- Joins (inner, outer, cross)
- Aggregate functions and GROUP BY
- Window functions
- CTEs (Common Table Expressions)
- Stored procedures and functions
- Triggers
- Full-text search
- JSON/JSONB columns
- Performance tuning

**AI Prompt**:
```
I know basic SQL. Teach me advanced PostgreSQL for production systems:

1. When and how to use indexes (B-tree, Hash, GIN, GiST)
2. Query optimization and EXPLAIN ANALYZE
3. Transaction isolation levels
4. Write complex queries for:
   - Monthly transaction summaries by customer
   - Top 10 customers by transaction volume
   - Fraud pattern detection (multiple transactions in short time)
   - Running balance calculation
   - Percentile analysis of transaction amounts

5. Best practices:
   - When to denormalize
   - Connection pooling
   - Backup strategies
   - Monitoring and alerting

Provide banking-specific examples.
```

**Hands-On Exercise**: Transaction Analytics SQL

```sql
-- Create optimized table
CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    account_id UUID NOT NULL,
    amount DECIMAL(19, 2) NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    merchant_id VARCHAR(100),
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    fraud_score DECIMAL(5, 2),
    status VARCHAR(20) NOT NULL,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX idx_account_timestamp ON transactions(account_id, timestamp DESC);
CREATE INDEX idx_fraud_score ON transactions(fraud_score) WHERE fraud_score > 50;
CREATE INDEX idx_metadata ON transactions USING GIN(metadata);

-- Monthly summary by customer
WITH monthly_stats AS (
    SELECT
        account_id,
        DATE_TRUNC('month', timestamp) AS month,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_amount,
        AVG(amount) AS avg_amount,
        MAX(amount) AS max_amount,
        AVG(fraud_score) AS avg_fraud_score
    FROM transactions
    WHERE timestamp >= NOW() - INTERVAL '12 months'
    GROUP BY account_id, DATE_TRUNC('month', timestamp)
)
SELECT
    account_id,
    month,
    transaction_count,
    total_amount,
    avg_amount,
    max_amount,
    avg_fraud_score,
    LAG(total_amount) OVER (PARTITION BY account_id ORDER BY month) AS prev_month_amount,
    (total_amount - LAG(total_amount) OVER (PARTITION BY account_id ORDER BY month)) /
        NULLIF(LAG(total_amount) OVER (PARTITION BY account_id ORDER BY month), 0) * 100 AS growth_percentage
FROM monthly_stats
ORDER BY account_id, month DESC;

-- Fraud pattern detection: Multiple transactions in short timeframe
SELECT
    account_id,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    ARRAY_AGG(timestamp ORDER BY timestamp) AS timestamps,
    MAX(timestamp) - MIN(timestamp) AS time_span
FROM transactions
WHERE timestamp >= NOW() - INTERVAL '1 hour'
GROUP BY account_id
HAVING COUNT(*) >= 5  -- 5+ transactions in 1 hour
ORDER BY transaction_count DESC;
```

---

### MongoDB (NoSQL)

**When to Use MongoDB**:
- Flexible schemas (rapidly changing data structures)
- Document-oriented data (user profiles, product catalogs)
- Hierarchical data
- High write throughput
- Horizontal scaling needs

**AI Prompt**:
```
Explain MongoDB to a relational database expert:

1. Collections vs Tables
2. Documents vs Rows
3. Embedding vs Referencing (when to use each)
4. Indexes in MongoDB
5. Aggregation pipeline
6. Transactions in MongoDB 4.0+
7. Schema design patterns

Use case: Store customer profiles with nested addresses,
preferences, and transaction history. Show:
- Document structure
- Mongoose schema (for Node.js)
- Common queries
- Aggregation pipeline example
```

**Quick Example**:

```javascript
// Mongoose schema for customer profile
import mongoose from 'mongoose';

const customerSchema = new mongoose.Schema({
  customerId: { type: String, required: true, unique: true },
  personalInfo: {
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    phone: String,
  },
  addresses: [{
    type: { type: String, enum: ['home', 'work', 'billing'] },
    street: String,
    city: String,
    state: String,
    zipCode: String,
    country: String,
    isDefault: Boolean
  }],
  accounts: [{
    accountId: { type: String, required: true },
    accountType: String,
    status: String
  }],
  preferences: {
    notifications: {
      email: { type: Boolean, default: true },
      sms: { type: Boolean, default: false },
      push: { type: Boolean, default: true }
    },
    language: { type: String, default: 'en' },
    currency: { type: String, default: 'USD' }
  },
  riskProfile: {
    score: Number,
    level: { type: String, enum: ['low', 'medium', 'high'] },
    lastUpdated: Date
  },
  metadata: {
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now },
    lastLogin: Date
  }
}, {
  timestamps: true  // Auto-manage createdAt and updatedAt
});

// Indexes
customerSchema.index({ email: 1 }, { unique: true });
customerSchema.index({ customerId: 1 }, { unique: true });
customerSchema.index({ 'accounts.accountId': 1 });

export const Customer = mongoose.model('Customer', customerSchema);

// Query examples
// Find customer with specific email
const customer = await Customer.findOne({ email: 'john@example.com' });

// Update preferences
await Customer.findOneAndUpdate(
  { customerId: 'CUST001' },
  {
    $set: {
      'preferences.notifications.email': false,
      'metadata.updatedAt': new Date()
    }
  },
  { new: true }  // Return updated document
);

// Aggregation: Count customers by risk level
const riskDistribution = await Customer.aggregate([
  {
    $group: {
      _id: '$riskProfile.level',
      count: { $sum: 1 },
      avgScore: { $avg: '$riskProfile.score' }
    }
  },
  {
    $sort: { count: -1 }
  }
]);
```

---

### Redis (Caching & Session Management)

**Use Cases**:
- Session storage
- Caching frequently accessed data
- Rate limiting
- Real-time leaderboards
- Message queues (pub/sub)

**Quick Setup**:

```javascript
// redis-client.js
import { createClient } from 'redis';

const redisClient = createClient({
  url: process.env.REDIS_URL || 'redis://localhost:6379'
});

redisClient.on('error', (err) => console.error('Redis Client Error', err));

await redisClient.connect();

export default redisClient;
```

```javascript
// Caching example
import redisClient from './redis-client.js';

// Cache account data for 5 minutes
export async function getAccountWithCache(accountId) {
  const cacheKey = `account:${accountId}`;

  // Try cache first
  const cached = await redisClient.get(cacheKey);
  if (cached) {
    console.log('Cache hit');
    return JSON.parse(cached);
  }

  // Cache miss - fetch from database
  console.log('Cache miss - fetching from DB');
  const account = await fetchAccountFromDB(accountId);

  // Store in cache (5 minutes TTL)
  await redisClient.setEx(cacheKey, 300, JSON.stringify(account));

  return account;
}

// Rate limiting
export async function checkRateLimit(userId, maxRequests = 10, windowSeconds = 60) {
  const key = `rate_limit:${userId}`;

  const current = await redisClient.incr(key);

  if (current === 1) {
    await redisClient.expire(key, windowSeconds);
  }

  if (current > maxRequests) {
    throw new Error('Rate limit exceeded');
  }

  return { allowed: true, remaining: maxRequests - current };
}
```

---

## Week 7-8 Major Project: Banking Dashboard (Full Stack)

### Project Brief
Build a complete banking dashboard that integrates all technologies learned so far.

**Stack**:
- **Frontend**: Next.js 14, TypeScript, Tailwind CSS, shadcn/ui
- **Backend**: Your choice (Java/Spring Boot, Node.js, or Python)
- **Databases**: PostgreSQL (accounts, transactions), MongoDB (customer profiles), Redis (caching)
- **Features**:
  1. User authentication (email/password)
  2. Account overview (balance, account number)
  3. Transaction history with filters
  4. Real-time transaction notifications
  5. Fraud alerts
  6. Analytics dashboard (charts with Chart.js or Recharts)
  7. Profile management
  8. Dark/light mode

**Success Metrics**:
- [ ] Responsive design (mobile, tablet, desktop)
- [ ] Sub-second page loads (caching implemented)
- [ ] Real-time updates (WebSocket or polling)
- [ ] Comprehensive error handling
- [ ] Accessibility (WCAG 2.1 AA)
- [ ] 80%+ test coverage
- [ ] Deployed to production (Vercel + Railway/Render)
- [ ] Lighthouse score 90+ on all metrics

**Time Estimate**: 30-35 hours

---

# PHASE 4: AI Integration - Gemini & Claude (Weeks 9-10)

## 🎯 Phase Overview

**Goal**: Integrate AI capabilities into applications using Google Gemini and Anthropic Claude APIs.

**Time Allocation**: 80-100 hours over 2 weeks
- Gemini API mastery: 15 hours
- Claude API mastery: 15 hours
- LangChain framework: 12 hours
- RAG (Retrieval Augmented Generation): 15 hours
- Vector databases: 10 hours
- Project: AI-Powered Financial Advisor: 30 hours

---

## Google Gemini API

### Getting Started

**AI Prompt to Learn Gemini**:
```
Explain Google Gemini API for a backend developer:

1. Gemini model versions (1.5 Pro, 1.5 Flash, 2.0) - when to use each
2. API authentication and setup
3. Text generation
4. Function calling (tool use)
5. Multi-turn conversations
6. Image understanding (multimodal)
7. JSON mode and structured outputs
8. Safety settings
9. Token limits and pricing
10. Best practices for production

Provide banking examples:
- Transaction categorization
- Fraud detection reasoning
- Customer service chatbot
- Document analysis (bank statements)
- Financial advice generation
```

**Quick Implementation**:

```javascript
// gemini-service.js
import { GoogleGenerativeAI } from '@google/generative-ai';

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);

export class GeminiService {
  constructor() {
    this.model = genAI.getGenerativeModel({
      model: 'gemini-1.5-pro',
      generationConfig: {
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      },
    });
  }

  async categorizeTransaction(description, amount) {
    const prompt = `
Analyze this transaction and categorize it:
Description: ${description}
Amount: $${amount}

Provide:
1. Category (e.g., Groceries, Entertainment, Bills, Transport)
2. Subcategory (more specific)
3. Confidence score (0-100)

Respond in JSON format:
{
  "category": "string",
  "subcategory": "string",
  "confidence": number,
  "reasoning": "string"
}
`;

    const result = await this.model.generateContent(prompt);
    const response = result.response.text();

    // Parse JSON from response
    const jsonMatch = response.match(/\{[\s\S]*\}/);
    if (jsonMatch) {
      return JSON.parse(jsonMatch[0]);
    }

    throw new Error('Failed to parse AI response');
  }

  async analyzeFraudRisk(transaction) {
    const prompt = `
Analyze this transaction for fraud risk:

Transaction Details:
- Amount: $${transaction.amount}
- Merchant: ${transaction.merchant}
- Location: ${transaction.location}
- Time: ${transaction.timestamp}
- Customer's usual spending: $${transaction.avgSpending}
- Customer location: ${transaction.customerLocation}

Provide fraud risk analysis in JSON:
{
  "riskScore": number (0-100),
  "riskLevel": "LOW|MEDIUM|HIGH|CRITICAL",
  "riskFactors": ["array", "of", "risk", "factors"],
  "recommendation": "APPROVE|REVIEW|BLOCK",
  "reasoning": "detailed explanation"
}
`;

    const result = await this.model.generateContent(prompt);
    return this.parseJSONResponse(result.response.text());
  }

  async chatWithCustomer(conversationHistory, userMessage) {
    const chat = this.model.startChat({
      history: conversationHistory.map(msg => ({
        role: msg.role, // 'user' or 'model'
        parts: [{ text: msg.content }],
      })),
    });

    const result = await chat.sendMessage(userMessage);
    return result.response.text();
  }

  parseJSONResponse(text) {
    const jsonMatch = text.match(/\{[\s\S]*\}/);
    if (jsonMatch) {
      return JSON.parse(jsonMatch[0]);
    }
    throw new Error('Failed to parse AI response');
  }
}
```

**Checklist: Gemini API**
- [ ] API key obtained and secured
- [ ] Understand model selection criteria
- [ ] Implement text generation
- [ ] Implement structured outputs (JSON mode)
- [ ] Multi-turn conversations
- [ ] Function/tool calling
- [ ] Error handling and retries
- [ ] Token counting and cost optimization
- [ ] Safety settings configuration

---

## Claude API & Claude Code

### Claude API Integration

**AI Prompt**:
```
Explain Anthropic Claude API:

1. Claude model tiers (Haiku, Sonnet, Opus) - when to use each
2. API authentication
3. Messages API (modern approach)
4. System prompts vs user messages
5. Tool use (function calling)
6. Streaming responses
7. Vision capabilities (Sonnet/Opus)
8. Best practices for prompt engineering with Claude
9. Cost optimization strategies

Build examples:
- Code review assistant
- Complex reasoning (financial analysis)
- Long document summarization
- Tool use for database queries
```

**Implementation**:

```python
# claude_service.py
import anthropic
import os
import json

class ClaudeService:
    def __init__(self):
        self.client = anthropic.Anthropic(
            api_key=os.environ.get("ANTHROPIC_API_KEY")
        )

    def analyze_financial_document(self, document_text):
        """Analyze financial document and extract key information"""

        message = self.client.messages.create(
            model="claude-sonnet-4.5-20250929",
            max_tokens=2048,
            temperature=0.2,  # Lower temperature for factual extraction
            system="""You are a financial document analyzer.
            Extract key information accurately and structure it in JSON format.
            Focus on: account numbers, balances, transactions, dates, amounts.""",
            messages=[
                {
                    "role": "user",
                    "content": f"""Analyze this bank statement and extract information in JSON format:

{document_text}

Provide:
{{
  "accountNumber": "string",
  "accountHolder": "string",
  "statementPeriod": {{"from": "YYYY-MM-DD", "to": "YYYY-MM-DD"}},
  "openingBalance": number,
  "closingBalance": number,
  "transactions": [
    {{
      "date": "YYYY-MM-DD",
      "description": "string",
      "amount": number,
      "type": "debit|credit"
    }}
  ],
  "summary": {{
    "totalDebits": number,
    "totalCredits": number,
    "largestTransaction": number
  }}
}}"""
                }
            ]
        )

        # Extract JSON from response
        response_text = message.content[0].text
        json_match = response_text[response_text.find('{'):response_text.rfind('}')+1]
        return json.loads(json_match)

    def financial_advisor_chat(self, user_question, user_context):
        """Provide personalized financial advice"""

        message = self.client.messages.create(
            model="claude-sonnet-4.5-20250929",
            max_tokens=1024,
            temperature=0.7,
            system="""You are a helpful financial advisor AI.
            Provide personalized, actionable financial advice based on the user's context.
            Always include disclaimers and encourage professional consultation for major decisions.""",
            messages=[
                {
                    "role": "user",
                    "content": f"""User Context:
- Age: {user_context['age']}
- Income: ${user_context['income']}
- Savings: ${user_context['savings']}
- Debt: ${user_context['debt']}
- Risk tolerance: {user_context['riskTolerance']}

Question: {user_question}

Provide practical, personalized advice."""
                }
            ]
        )

        return message.content[0].text

    def code_review(self, code, language):
        """Review code for security, performance, and best practices"""

        message = self.client.messages.create(
            model="claude-sonnet-4.5-20250929",
            max_tokens=2048,
            temperature=0.3,
            system=f"""You are an expert {language} code reviewer.
            Focus on: security vulnerabilities, performance issues, best practices,
            potential bugs, and code quality.""",
            messages=[
                {
                    "role": "user",
                    "content": f"""Review this {language} code:

```{language}
{code}
```

Provide:
1. Security issues (with severity)
2. Performance concerns
3. Best practice violations
4. Potential bugs
5. Suggested improvements (with code examples)

Format as structured markdown."""
                }
            ]
        )

        return message.content[0].text

    def streaming_response(self, user_message):
        """Stream response for better UX"""

        with self.client.messages.stream(
            model="claude-sonnet-4.5-20250929",
            max_tokens=1024,
            messages=[{"role": "user", "content": user_message}]
        ) as stream:
            for text in stream.text_stream:
                print(text, end="", flush=True)
```

**Tool Use Example**:

```python
# Claude with function calling
def get_account_balance(account_id: str) -> dict:
    """Simulated database call"""
    return {
        "account_id": account_id,
        "balance": 15234.50,
        "currency": "USD"
    }

def claude_with_tools():
    client = anthropic.Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

    tools = [
        {
            "name": "get_account_balance",
            "description": "Retrieves the current balance for a given account ID",
            "input_schema": {
                "type": "object",
                "properties": {
                    "account_id": {
                        "type": "string",
                        "description": "The unique identifier for the account"
                    }
                },
                "required": ["account_id"]
            }
        }
    ]

    user_message = "What's the balance for account ACC123456?"

    message = client.messages.create(
        model="claude-sonnet-4.5-20250929",
        max_tokens=1024,
        tools=tools,
        messages=[{"role": "user", "content": user_message}]
    )

    # Check if Claude wants to use a tool
    if message.stop_reason == "tool_use":
        tool_use = next(block for block in message.content if block.type == "tool_use")
        tool_name = tool_use.name
        tool_input = tool_use.input

        # Execute the tool
        if tool_name == "get_account_balance":
            result = get_account_balance(tool_input["account_id"])

            # Send result back to Claude
            response = client.messages.create(
                model="claude-sonnet-4.5-20250929",
                max_tokens=1024,
                tools=tools,
                messages=[
                    {"role": "user", "content": user_message},
                    {"role": "assistant", "content": message.content},
                    {
                        "role": "user",
                        "content": [
                            {
                                "type": "tool_result",
                                "tool_use_id": tool_use.id,
                                "content": json.dumps(result)
                            }
                        ]
                    }
                ]
            )

            return response.content[0].text

    return message.content[0].text
```

---

## RAG (Retrieval Augmented Generation)

### What is RAG?

**Concept**: Enhance AI responses by retrieving relevant context from your data before generating a response.

**Flow**:
1. User asks question
2. Convert question to vector embedding
3. Search vector database for similar content
4. Retrieve top-k most relevant documents
5. Pass documents + question to AI
6. AI generates response based on retrieved context

**AI Prompt to Learn RAG**:
```
Explain RAG (Retrieval Augmented Generation) system:

1. What problem does RAG solve?
2. Vector embeddings - what are they?
3. Vector databases (Pinecone, Weaviate, Chroma)
4. Chunking strategies for documents
5. Similarity search algorithms
6. Prompt engineering for RAG
7. Evaluation metrics (retrieval quality, answer quality)

Build a banking knowledge base RAG system:
- Ingests bank policy documents
- Answers customer questions based on policies
- Cites sources in responses
- Handles multi-document queries

Technologies: LangChain, Pinecone, OpenAI/Gemini embeddings
```

### RAG Implementation

**Dependencies**:
```bash
pip install langchain langchain-community langchain-openai
pip install pinecone-client
pip install sentence-transformers
pip install chromadb  # Local vector DB for development
pip install pypdf  # For PDF processing
```

**Implementation**:

```python
# rag_service.py
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma
from langchain.chains import RetrievalQA
from langchain_community.llms import HuggingFaceHub
import anthropic
import os

class BankingRAGSystem:
    def __init__(self):
        # Initialize embeddings model (local, free)
        self.embeddings = HuggingFaceEmbeddings(
            model_name="sentence-transformers/all-MiniLM-L6-v2"
        )

        # Initialize vector store
        self.vector_store = Chroma(
            collection_name="banking_docs",
            embedding_function=self.embeddings,
            persist_directory="./chroma_db"
        )

        # Claude client for generation
        self.claude = anthropic.Anthropic(
            api_key=os.environ.get("ANTHROPIC_API_KEY")
        )

    def ingest_documents(self, documents: list[str]):
        """
        Ingest documents into vector store

        Args:
            documents: List of document texts
        """
        # Split documents into chunks
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=200,
            length_function=len
        )

        chunks = []
        metadatas = []

        for i, doc in enumerate(documents):
            doc_chunks = text_splitter.split_text(doc)
            chunks.extend(doc_chunks)
            metadatas.extend([{"source": f"doc_{i}", "chunk": j}
                            for j in range(len(doc_chunks))])

        # Add to vector store
        self.vector_store.add_texts(texts=chunks, metadatas=metadatas)
        self.vector_store.persist()

        print(f"Ingested {len(chunks)} chunks from {len(documents)} documents")

    def query(self, question: str, k: int = 5):
        """
        Query the RAG system

        Args:
            question: User's question
            k: Number of relevant chunks to retrieve

        Returns:
            AI-generated answer with sources
        """
        # Retrieve relevant documents
        docs = self.vector_store.similarity_search(question, k=k)

        # Build context from retrieved documents
        context = "\n\n".join([
            f"[Source {i+1}]\n{doc.page_content}"
            for i, doc in enumerate(docs)
        ])

        # Generate answer using Claude
        prompt = f"""Based on the following information from banking policy documents, answer the user's question.
If the answer is not in the provided context, say so.

Context:
{context}

Question: {question}

Provide a clear, accurate answer. Cite the source numbers when referencing specific information."""

        message = self.claude.messages.create(
            model="claude-sonnet-4.5-20250929",
            max_tokens=1024,
            temperature=0.3,
            messages=[
                {"role": "user", "content": prompt}
            ]
        )

        answer = message.content[0].text

        # Return answer with sources
        return {
            "answer": answer,
            "sources": [
                {
                    "content": doc.page_content,
                    "metadata": doc.metadata
                }
                for doc in docs
            ]
        }

# Usage example
if __name__ == "__main__":
    rag = BankingRAGSystem()

    # Ingest sample banking documents
    documents = [
        """
        Account Overdraft Policy:
        Customers with checking accounts are eligible for overdraft protection.
        The overdraft limit is $500 for standard accounts and $1,000 for premium accounts.
        Overdraft fees are $35 per transaction.
        Customers can opt-out of overdraft protection at any time.
        """,
        """
        Wire Transfer Policy:
        Domestic wire transfers are processed within 1 business day.
        International wire transfers may take 3-5 business days.
        Wire transfer fees: $25 for domestic, $45 for international.
        Daily wire transfer limit: $10,000 for standard accounts, $50,000 for business accounts.
        """,
        """
        Fraud Protection:
        All debit and credit card transactions are monitored 24/7 for suspicious activity.
        Customers are not liable for unauthorized transactions if reported within 60 days.
        Two-factor authentication is required for online banking access.
        Customers receive real-time alerts for transactions over $500.
        """
    ]

    rag.ingest_documents(documents)

    # Query examples
    result = rag.query("What is the overdraft limit for premium accounts?")
    print("Answer:", result["answer"])
    print("\nSources:")
    for i, source in enumerate(result["sources"], 1):
        print(f"{i}. {source['content'][:100]}...")
```

---

## Week 9-10 Major Project: AI Financial Advisor

### Project Brief
Build an AI-powered financial advisor application that provides personalized financial guidance.

**Features**:
1. **RAG-Based Knowledge Base**:
   - Ingest financial education content
   - Answer questions about investing, saving, budgeting
   - Cite sources

2. **Personalized Analysis**:
   - Analyze user's financial situation
   - Provide customized recommendations
   - Budget planning assistance

3. **Transaction Intelligence**:
   - Automatic categorization
   - Spending insights
   - Anomaly detection

4. **Document Analysis**:
   - Upload bank statements (PDF)
   - Extract transactions
   - Generate summaries

5. **Conversational Interface**:
   - Multi-turn conversations
   - Context awareness
   - Natural language queries

**Tech Stack**:
- **Frontend**: Next.js, TypeScript, Tailwind
- **Backend**: Python FastAPI
- **AI**: Claude API, Gemini API
- **Vector DB**: Pinecone or Chroma
- **Database**: PostgreSQL (user data), MongoDB (conversations)
- **File Storage**: AWS S3 or Cloudflare R2

**Success Metrics**:
- [ ] RAG system with 90%+ retrieval accuracy
- [ ] Handles 100+ document pages in knowledge base
- [ ] Sub-2-second response time
- [ ] Conversation context maintained across 10+ turns
- [ ] PDF document processing works reliably
- [ ] Personalized recommendations based on user data
- [ ] Comprehensive test coverage
- [ ] Deployed to production

**Time Estimate**: 30-35 hours

---

# PHASE 5: MCP & Agentic AI Development (Weeks 11-12)

## 🎯 Phase Overview

**Goal**: Build autonomous AI agents using Model Context Protocol (MCP) and agentic frameworks.

**Time Allocation**: 80-100 hours over 2 weeks
- Understanding AI agents: 10 hours
- Model Context Protocol (MCP): 15 hours
- LangGraph & agent frameworks: 20 hours
- Tool creation for agents: 15 hours
- Major project (AI Banking Assistant): 35 hours

---

## Understanding AI Agents

**What are AI Agents?**
AI systems that can:
- Take actions autonomously
- Use tools/functions
- Make decisions based on reasoning
- Iterate until task is complete
- Handle multi-step workflows

**Agent Types**:
1. **ReAct Agents**: Reason + Act in a loop
2. **Function-calling Agents**: Use predefined tools
3. **Planning Agents**: Create and execute plans
4. **Multi-agent Systems**: Multiple specialized agents collaborate

**AI Prompt to Learn Agents**:
```
Explain AI agents to a software engineer:

1. What makes something an "agent" vs regular AI?
2. ReAct pattern (Reasoning + Acting)
3. Tool use and function calling
4. Agent frameworks (LangGraph, AutoGPT, CrewAI)
5. Memory systems for agents
6. Error handling and retries
7. Agent orchestration

Build a banking automation agent that can:
- Check account balances (tool)
- Transfer money between accounts (tool)
- Pay bills (tool)
- Answer questions about transactions
- Provide financial advice
- Detect anomalies and alert

Show implementation with LangGraph and Claude.
```

---

## Model Context Protocol (MCP)

### What is MCP?

**Definition**: Open protocol for connecting AI models to data sources and tools, developed by Anthropic.

**Key Concepts**:
- **MCP Servers**: Provide resources, tools, and prompts to AI
- **MCP Clients**: Applications that connect to MCP servers (like Claude Code)
- **Resources**: Data sources (files, databases, APIs)
- **Tools**: Functions the AI can call
- **Prompts**: Reusable prompt templates

**Benefits**:
- Standardized way to extend AI capabilities
- Connect AI to your systems securely
- Reusable across different AI applications
- Growing ecosystem of MCP servers

### Building an MCP Server

**AI Prompt**:
```
Explain Model Context Protocol (MCP) step by step:

1. What problem does MCP solve?
2. Architecture (servers, clients, protocol)
3. How to build an MCP server
4. Implementing resources, tools, and prompts
5. Security considerations
6. Testing MCP servers
7. Deploying MCP servers

Build an MCP server for banking that provides:
- Tool: get_account_balance(account_id)
- Tool: get_transactions(account_id, from_date, to_date)
- Tool: transfer_funds(from_account, to_account, amount)
- Resource: customer_profiles (database)
- Prompt: fraud_analysis_template

Use Python and official MCP SDK.
```

**MCP Server Implementation**:

```python
# banking_mcp_server.py
from mcp.server import Server, Tool, Resource, Prompt
from mcp.types import TextContent
import asyncio
import json
from typing import List, Dict

# Initialize MCP server
server = Server("banking-mcp-server")

# Simulated database (replace with real DB in production)
ACCOUNTS = {
    "ACC001": {"balance": 5000.00, "customer_id": "CUST001"},
    "ACC002": {"balance": 12500.00, "customer_id": "CUST001"},
}

TRANSACTIONS = {
    "ACC001": [
        {"date": "2026-01-15", "amount": -50.00, "merchant": "Grocery Store"},
        {"date": "2026-01-16", "amount": -125.00, "merchant": "Electric Company"},
        {"date": "2026-01-17", "amount": 1000.00, "merchant": "Payroll Deposit"},
    ]
}

# Define Tools
@server.tool()
async def get_account_balance(account_id: str) -> TextContent:
    """
    Retrieve the current balance for a given account.

    Args:
        account_id: The unique identifier for the account (e.g., "ACC001")
    """
    if account_id not in ACCOUNTS:
        return TextContent(
            type="text",
            text=json.dumps({"error": "Account not found"})
        )

    balance = ACCOUNTS[account_id]["balance"]
    return TextContent(
        type="text",
        text=json.dumps({
            "account_id": account_id,
            "balance": balance,
            "currency": "USD"
        })
    )

@server.tool()
async def get_transactions(
    account_id: str,
    from_date: str = None,
    to_date: str = None,
    limit: int = 10
) -> TextContent:
    """
    Retrieve transactions for an account within a date range.

    Args:
        account_id: Account identifier
        from_date: Start date (YYYY-MM-DD format)
        to_date: End date (YYYY-MM-DD format)
        limit: Maximum number of transactions to return
    """
    if account_id not in TRANSACTIONS:
        return TextContent(
            type="text",
            text=json.dumps({"error": "Account not found"})
        )

    transactions = TRANSACTIONS[account_id]

    # Filter by date if provided (simplified for demo)
    # In production, use proper date filtering with database

    return TextContent(
        type="text",
        text=json.dumps({
            "account_id": account_id,
            "transactions": transactions[:limit]
        })
    )

@server.tool()
async def transfer_funds(
    from_account: str,
    to_account: str,
    amount: float
) -> TextContent:
    """
    Transfer funds between two accounts.

    Args:
        from_account: Source account ID
        to_account: Destination account ID
        amount: Amount to transfer (must be positive)

    Returns:
        Transaction confirmation or error
    """
    # Validation
    if amount <= 0:
        return TextContent(
            type="text",
            text=json.dumps({"error": "Amount must be positive"})
        )

    if from_account not in ACCOUNTS:
        return TextContent(
            type="text",
            text=json.dumps({"error": f"Source account {from_account} not found"})
        )

    if to_account not in ACCOUNTS:
        return TextContent(
            type="text",
            text=json.dumps({"error": f"Destination account {to_account} not found"})
        )

    if ACCOUNTS[from_account]["balance"] < amount:
        return TextContent(
            type="text",
            text=json.dumps({"error": "Insufficient funds"})
        )

    # Perform transfer
    ACCOUNTS[from_account]["balance"] -= amount
    ACCOUNTS[to_account]["balance"] += amount

    # Record transactions
    TRANSACTIONS[from_account].append({
        "date": "2026-01-18",
        "amount": -amount,
        "merchant": f"Transfer to {to_account}"
    })

    TRANSACTIONS[to_account].append({
        "date": "2026-01-18",
        "amount": amount,
        "merchant": f"Transfer from {from_account}"
    })

    return TextContent(
        type="text",
        text=json.dumps({
            "success": True,
            "transaction_id": "TXN123456",
            "from_account": from_account,
            "to_account": to_account,
            "amount": amount,
            "new_balance": ACCOUNTS[from_account]["balance"]
        })
    )

# Define Resources
@server.resource("customer://profiles")
async def get_customer_profiles() -> TextContent:
    """
    Access customer profile database.
    Provides customer information for personalization.
    """
    profiles = {
        "CUST001": {
            "name": "John Doe",
            "email": "john@example.com",
            "accounts": ["ACC001", "ACC002"],
            "risk_tolerance": "moderate"
        }
    }

    return TextContent(
        type="text",
        text=json.dumps(profiles)
    )

# Define Prompts
@server.prompt()
async def fraud_analysis_template() -> str:
    """
    Template for analyzing transactions for fraud.
    """
    return """Analyze the following transaction for potential fraud:

Transaction Details:
{transaction_details}

Customer Profile:
{customer_profile}

Recent Transaction History:
{recent_transactions}

Provide:
1. Fraud risk score (0-100)
2. Risk level (LOW/MEDIUM/HIGH/CRITICAL)
3. Specific risk factors identified
4. Recommendation (APPROVE/REVIEW/BLOCK)
5. Detailed reasoning

Format your response as JSON."""

# Run the server
if __name__ == "__main__":
    async def main():
        async with server:
            await server.serve()

    asyncio.run(main())
```

**MCP Server Configuration** (`mcp.json`):
```json
{
  "name": "banking-mcp-server",
  "version": "1.0.0",
  "description": "MCP server providing banking tools and resources",
  "author": "Your Name",
  "capabilities": {
    "tools": [
      {
        "name": "get_account_balance",
        "description": "Retrieve account balance",
        "parameters": {
          "account_id": "string"
        }
      },
      {
        "name": "get_transactions",
        "description": "Retrieve account transactions",
        "parameters": {
          "account_id": "string",
          "from_date": "string (optional)",
          "to_date": "string (optional)",
          "limit": "integer (optional)"
        }
      },
      {
        "name": "transfer_funds",
        "description": "Transfer money between accounts",
        "parameters": {
          "from_account": "string",
          "to_account": "string",
          "amount": "number"
        }
      }
    ],
    "resources": [
      {
        "uri": "customer://profiles",
        "description": "Customer profile database"
      }
    ],
    "prompts": [
      {
        "name": "fraud_analysis_template",
        "description": "Template for fraud detection analysis"
      }
    ]
  }
}
```

**Testing MCP Server with Claude Code**:

```bash
# Install MCP SDK
pip install mcp

# Run MCP server
python banking_mcp_server.py

# In another terminal, connect with Claude Code
claude-code --mcp-server http://localhost:8000

# Now Claude Code can use your banking tools!
```

**Checklist: MCP Development**
- [ ] Understand MCP architecture
- [ ] Built custom MCP server
- [ ] Implemented at least 3 tools
- [ ] Implemented at least 1 resource
- [ ] Implemented at least 1 prompt template
- [ ] Tested with MCP client (Claude Code)
- [ ] Error handling for tools
- [ ] Authentication/authorization (if needed)
- [ ] Documentation for MCP server

---

## Agentic Frameworks: LangGraph

**LangGraph**: Framework for building stateful, multi-actor AI applications.

**Key Concepts**:
- **StateGraph**: Defines agent workflow
- **Nodes**: Steps in the workflow
- **Edges**: Transitions between nodes
- **Conditional Edges**: Dynamic routing based on state
- **Memory**: Persist conversation and state

**Agent Implementation with LangGraph**:

```python
# banking_agent.py
from langgraph.graph import StateGraph, END
from langchain_anthropic import ChatAnthropic
from typing import TypedDict, Annotated, Sequence
from langchain_core.messages import BaseMessage, HumanMessage, AIMessage
import operator

# Define agent state
class AgentState(TypedDict):
    messages: Annotated[Sequence[BaseMessage], operator.add]
    account_id: str
    balance: float
    pending_transfer: dict

# Initialize Claude
llm = ChatAnthropic(model="claude-sonnet-4.5-20250929")

# Define tools (MCP tools from above)
tools = [get_account_balance, get_transactions, transfer_funds]

# Tool execution node
def call_tool(state: AgentState):
    messages = state["messages"]
    last_message = messages[-1]

    # Extract tool call from message
    # Execute tool
    # Return result

    return {"messages": [AIMessage(content="Tool executed successfully")]}

# Reasoning node
def reason(state: AgentState):
    messages = state["messages"]

    # Use Claude to reason about next action
    response = llm.invoke(messages)

    return {"messages": [response]}

# Decision node (conditional routing)
def should_continue(state: AgentState):
    messages = state["messages"]
    last_message = messages[-1]

    # If no tool calls, we're done
    if not hasattr(last_message, "tool_calls") or not last_message.tool_calls:
        return "end"

    return "continue"

# Build graph
workflow = StateGraph(AgentState)

# Add nodes
workflow.add_node("reason", reason)
workflow.add_node("tool", call_tool)

# Add edges
workflow.set_entry_point("reason")
workflow.add_conditional_edges(
    "reason",
    should_continue,
    {
        "continue": "tool",
        "end": END
    }
)
workflow.add_edge("tool", "reason")

# Compile
app = workflow.compile()

# Run agent
if __name__ == "__main__":
    initial_state = {
        "messages": [
            HumanMessage(content="What's the balance of account ACC001 and transfer $100 to ACC002?")
        ],
        "account_id": None,
        "balance": 0.0,
        "pending_transfer": {}
    }

    result = app.invoke(initial_state)

    print("Final Messages:")
    for msg in result["messages"]:
        print(f"{msg.type}: {msg.content}")
```

---

## Week 11-12 Major Project: AI Banking Assistant (Multi-Agent System)

### Project Brief
Build a sophisticated AI banking assistant that can handle complex user requests autonomously.

**Agent Types**:
1. **Account Manager Agent**: Handle account operations
2. **Transaction Agent**: Process payments, transfers
3. **Fraud Detection Agent**: Monitor and flag suspicious activity
4. **Customer Service Agent**: Answer questions, provide help
5. **Orchestrator Agent**: Routes requests to appropriate agent

**Capabilities**:
- Natural language commands ("Pay my electric bill")
- Multi-step workflows ("Transfer $500 to savings and send confirmation email")
- Proactive fraud alerts
- Personalized financial insights
- Learn from user patterns

**Architecture**:
```
User Query
    ↓
Orchestrator Agent (LangGraph)
    ↓
   ┌─────────────────────────┐
   ↓           ↓             ↓
Account   Transaction   Fraud Detection
Manager     Agent          Agent
   ↓           ↓             ↓
 MCP Tools  MCP Tools    MCP Tools
   ↓           ↓             ↓
PostgreSQL  PostgreSQL  AI Models
```

**Tech Stack**:
- **Agent Framework**: LangGraph
- **AI Models**: Claude Opus (orchestrator), Sonnet (specialized agents)
- **MCP**: Custom banking MCP server
- **Backend**: Python FastAPI
- **Frontend**: Next.js chat interface
- **Databases**: PostgreSQL, Redis (session state)
- **Message Queue**: RabbitMQ or Redis (for async operations)

**Success Criteria**:
- [ ] Handle 20+ different types of banking commands
- [ ] Multi-turn conversations with context
- [ ] Execute multi-step workflows (3+ steps)
- [ ] Fraud detection accuracy >95%
- [ ] Response time <3 seconds for simple queries
- [ ] Error recovery and clarification requests
- [ ] Comprehensive audit logging
- [ ] Deployed to production with monitoring

**Time Estimate**: 35-40 hours

---

# PHASE 6: Testing, DevOps & Production Systems (Week 13)

## 🎯 Phase Overview

**Goal**: Master testing strategies and deployment practices for production-ready applications.

**Time Allocation**: 40-50 hours in 1 week
- Testing fundamentals: 8 hours
- Test automation (Java, Node, Python): 12 hours
- Docker & containerization: 8 hours
- CI/CD pipelines: 8 hours
- Monitoring & observability: 6 hours
- Security best practices: 6 hours

---

## Comprehensive Testing Strategy

### Testing Pyramid

```
           /\
          /  \
         / E2E \ (10%)
        /------\
       /        \
      / Integration \ (30%)
     /--------------\
    /                \
   /   Unit Tests     \ (60%)
  /--------------------\
```

### Test Types

1. **Unit Tests**: Test individual functions/methods
2. **Integration Tests**: Test component interactions
3. **E2E Tests**: Test complete user workflows
4. **Contract Tests**: Test API contracts
5. **Performance Tests**: Load, stress, spike testing
6. **Security Tests**: Vulnerability scanning

### Testing Frameworks by Stack

**Java/Spring Boot**:
- JUnit 5 (unit tests)
- Mockito (mocking)
- Spring Boot Test (integration tests)
- Testcontainers (database tests with Docker)
- RestAssured (API tests)
- JMeter (performance tests)

**Node.js**:
- Jest (unit & integration)
- Supertest (API tests)
- Cypress (E2E)
- Artillery (performance)

**Python**:
- pytest (unit & integration)
- pytest-mock (mocking)
- httpx/requests (API tests)
- Locust (performance)

---

## CI/CD Pipeline Example

**.github/workflows/ci-cd.yml**:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    name: Run Tests
    runs-on: ubuntu-latest

    services:
      postgres:
        image: postgres:16
        env:
          POSTGRES_PASSWORD: testpass
          POSTGRES_DB: testdb
        ports:
          - 5432:5432
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
      - uses: actions/checkout@v4

      - name: Set up JDK 21
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '21'
          cache: 'maven'

      - name: Run unit tests
        run: mvn test

      - name: Run integration tests
        run: mvn verify
        env:
          SPRING_DATASOURCE_URL: jdbc:postgresql://localhost:5432/testdb
          SPRING_DATASOURCE_USERNAME: postgres
          SPRING_DATASOURCE_PASSWORD: testpass

      - name: Generate coverage report
        run: mvn jacoco:report

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          files: ./target/site/jacoco/jacoco.xml

      - name: SonarQube Scan
        run: mvn sonar:sonar
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}

  build-and-deploy:
    name: Build and Deploy
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'

    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: yourusername/banking-api:${{ github.sha }},yourusername/banking-api:latest
          cache-from: type=gha
          cache-to: type=gha,mode=max

      - name: Deploy to Railway
        run: |
          # Railway deployment commands
          echo "Deploying to Railway..."
```

---

## Docker Setup

**Dockerfile (Multi-stage build)**:

```dockerfile
# Build stage
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Create non-root user
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Run application
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**docker-compose.yml** (Local development):

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: bankingdb
      POSTGRES_USER: bankuser
      POSTGRES_PASSWORD: bankpass
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U bankuser"]
      interval: 10s
      timeout: 5s
      retries: 5

  mongodb:
    image: mongo:7
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: adminpass
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    command: redis-server --appendonly yes
    volumes:
      - redis_data:/data

  backend:
    build: .
    ports:
      - "8080:8080"
    environment:
      SPRING_PROFILES_ACTIVE: dev
      SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/bankingdb
      SPRING_DATASOURCE_USERNAME: bankuser
      SPRING_DATASOURCE_PASSWORD: bankpass
      SPRING_DATA_MONGODB_URI: mongodb://admin:adminpass@mongodb:27017/banking?authSource=admin
      SPRING_DATA_REDIS_HOST: redis
    depends_on:
      postgres:
        condition: service_healthy
      mongodb:
        condition: service_started
      redis:
        condition: service_started

volumes:
  postgres_data:
  mongo_data:
  redis_data:
```

---

## Monitoring & Observability

**Key Metrics to Track**:
1. **Application Metrics**: Request rate, latency, error rate
2. **Infrastructure Metrics**: CPU, memory, disk, network
3. **Business Metrics**: Transactions/sec, fraud detection rate
4. **Database Metrics**: Query time, connection pool usage

**Tools**:
- **Metrics**: Prometheus + Grafana
- **Logging**: ELK Stack (Elasticsearch, Logstash, Kibana) or Loki
- **Tracing**: Jaeger or Zipkin
- **APM**: New Relic, Datadog, or Sentry

**Spring Boot Actuator + Prometheus**:

```yaml
# application.yml
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  metrics:
    export:
      prometheus:
        enabled: true
    tags:
      application: ${spring.application.name}
```

---

## Security Best Practices Checklist

- [ ] Use HTTPS everywhere (TLS 1.2+)
- [ ] Implement authentication (JWT, OAuth2)
- [ ] Implement authorization (role-based access control)
- [ ] Input validation on all endpoints
- [ ] Output encoding (prevent XSS)
- [ ] Parameterized queries (prevent SQL injection)
- [ ] Rate limiting on API endpoints
- [ ] CORS configuration (restrictive)
- [ ] Security headers (Helmet.js, Spring Security)
- [ ] Secrets management (environment variables, vaults)
- [ ] Regular dependency updates (Dependabot)
- [ ] Security scanning (Snyk, OWASP Dependency Check)
- [ ] Audit logging for sensitive operations
- [ ] Data encryption at rest and in transit
- [ ] Regular security testing (penetration testing)

---

# PHASE 7: Portfolio Projects & Interview Prep (Weeks 14-16)

## 🎯 Phase Overview

**Goal**: Build 3 comprehensive portfolio projects and prepare for technical interviews.

**Time Allocation**: 120 hours over 3 weeks
- Project 1 (Full-stack banking app): 40 hours
- Project 2 (AI-powered tool): 30 hours
- Project 3 (Open-source contribution): 20 hours
- Portfolio refinement: 10 hours
- Interview preparation: 20 hours

---

## Project 1: NeoBank - Complete Banking Platform

**Overview**: Full-featured digital banking platform showcasing all skills.

**Tech Stack**:
- Frontend: Next.js 14, TypeScript, Tailwind, shadcn/ui
- Backend: Spring Boot 3.2, Java 21
- Databases: PostgreSQL, MongoDB, Redis
- AI: Gemini (fraud detection), Claude (customer support)
- DevOps: Docker, GitHub Actions, deployed to cloud

**Features**:
1. User authentication & authorization
2. Account management (create, view, close)
3. Transfers & payments
4. Transaction history with search/filter
5. AI fraud detection
6. AI chatbot for customer support
7. Budget tracking & insights
8. Bill payment automation
9. Admin dashboard
10. Real-time notifications

**GitHub Repository Structure**:
```
neobank/
├── frontend/ (Next.js)
├── backend/ (Spring Boot)
├── ai-services/ (Python FastAPI)
├── docker-compose.yml
├── .github/workflows/
├── docs/
│   ├── API.md
│   ├── ARCHITECTURE.md
│   └── SETUP.md
└── README.md (comprehensive)
```

**README Template**:
```markdown
# NeoBank - Modern Digital Banking Platform

## 🏦 Overview
NeoBank is a full-stack digital banking platform with AI-powered fraud detection
and customer support. Built as a portfolio project demonstrating modern software
engineering practices.

## ✨ Features
- 🔐 Secure authentication with JWT
- 💳 Multiple account types (Savings, Checking)
- 💸 Instant transfers between accounts
- 🤖 AI-powered fraud detection (Google Gemini)
- 💬 24/7 AI customer support (Claude)
- 📊 Budget tracking and spending insights
- 📱 Responsive design (mobile-first)
- 🔔 Real-time notifications

## 🛠️ Tech Stack
**Frontend:**
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui
- Zustand (state management)

**Backend:**
- Java 21
- Spring Boot 3.2
- Spring Security (JWT)
- Spring Data JPA
- PostgreSQL
- Redis (caching)
- MongoDB (documents)

**AI/ML:**
- Google Gemini API
- Anthropic Claude API
- LangChain

**DevOps:**
- Docker & Docker Compose
- GitHub Actions (CI/CD)
- Deployed on Railway

## 🚀 Quick Start

### Prerequisites
- Java 21
- Node.js 20+
- Docker & Docker Compose
- PostgreSQL 16
- Redis 7

### Local Development

1. Clone repository:
```bash
git clone https://github.com/yourusername/neobank.git
cd neobank
```

2. Start databases:
```bash
docker-compose up -d postgres redis mongodb
```

3. Start backend:
```bash
cd backend
./mvnw spring-boot:run
```

4. Start frontend:
```bash
cd frontend
npm install
npm run dev
```

5. Access application: http://localhost:3000

## 📸 Screenshots
[Add screenshots here]

## 🏗️ Architecture
[Add architecture diagram]

## 🧪 Testing
- Unit Tests: 85% coverage
- Integration Tests: Key flows covered
- E2E Tests: Critical user journeys

```bash
# Run all tests
./mvnw verify
cd frontend && npm test
```

## 📊 Performance
- Lighthouse Score: 95+
- API Response Time: <200ms (p95)
- Database Queries: Optimized with indexes
- Caching: Redis for frequently accessed data

## 🔒 Security
- HTTPS enforced
- JWT authentication
- Input validation
- SQL injection prevention
- XSS protection
- CORS configured
- Rate limiting
- Security headers

## 📝 License
MIT License

## 👤 Author
Your Name - [LinkedIn](https://linkedin.com/in/yourprofile) - [Portfolio](https://yourportfolio.com)

## 🙏 Acknowledgments
- Built as part of Full Stack AI Engineer training program
- Inspired by modern fintech applications
```

---

## Project 2: FinanceGPT - AI Financial Analysis Tool

**Overview**: SaaS tool for AI-powered financial document analysis and insights.

**Features**:
- Upload bank statements, invoices, receipts (PDF/images)
- AI extraction of transactions and data
- Automatic categorization and tagging
- Spending insights and recommendations
- Budget forecasting
- Multi-user support (for families/teams)
- Export reports (PDF, Excel)

**Unique Selling Points**:
- Multi-modal AI (text + image analysis)
- RAG-based financial knowledge
- Natural language queries
- Beautiful data visualizations

---

## Interview Preparation

### Technical Interview Topics

**Data Structures & Algorithms**:
- Arrays, Strings, Hash Maps
- Trees, Graphs
- Dynamic Programming
- System Design

**Resources**:
- LeetCode: 100 problems (Easy: 40, Medium: 50, Hard: 10)
- System Design: Design banking system, payment gateway
- Behavioral: STAR method preparation

**AI Prompts for Interview Prep**:
```
Help me prepare for technical interviews:

1. Generate 10 medium-level coding problems related to fintech/banking
2. Walk me through solving each with optimal approach
3. Discuss time/space complexity
4. Provide common variations and follow-up questions

Then help with system design:
1. Design a payment processing system (like Stripe)
2. Design a fraud detection system
3. Design a real-time banking dashboard

For each:
- Clarifying questions to ask
- High-level architecture
- Database schema
- API design
- Scaling considerations
- Trade-offs and alternatives
```

### Behavioral Interview Prep

**Common Questions**:
1. Tell me about yourself
2. Why transition from management to engineering?
3. Describe a challenging project
4. How do you handle conflict?
5. Where do you see yourself in 5 years?

**Your Story (Draft)**:
```
"I've spent 15 years in banking technology, progressively moving into
leadership roles. While I enjoyed the strategic aspects, I missed the
hands-on creation of solutions. Over the past 4 months, I've intensively
retrained as a full-stack engineer with a focus on AI integration.

I've built 3 comprehensive projects showcasing modern stacks (Java/Spring Boot,
Node.js, Python, React) and AI capabilities (Gemini, Claude, RAG systems).
My unique combination of deep domain expertise in banking and fresh technical
skills allows me to bridge business needs with technical implementation effectively.

I'm particularly excited about roles where I can build AI-powered financial
products that solve real user problems."
```

**STAR Method Examples**:
Prepare 10 stories covering:
- Technical challenge overcome
- Leadership/mentorship
- Dealing with ambiguity
- Fast learning
- Collaboration
- Failure and learning

---

# AI PROMPTING MASTER GUIDE

## Core Prompting Principles

### 1. Be Specific and Detailed

❌ **Bad**: "Write a function"
✅ **Good**: "Write a Python function that validates email addresses using regex, handles edge cases (missing @, multiple @, invalid domains), includes type hints, docstring, and pytest tests"

### 2. Provide Context

```
Context: I'm building a banking API with Spring Boot.
Current Setup: PostgreSQL database, JPA repositories, existing User entity.
Goal: Add password reset functionality.

Requirements:
1. Generate secure reset token (UUID)
2. Store token with expiration (24 hours)
3. Send email with reset link
4. Validate token and allow password change
5. Invalidate token after use

Provide:
- Entity changes (if any)
- Service layer code
- Controller endpoint
- Security considerations
- Tests
```

### 3. Iterative Refinement

```
[First Prompt]: Create a transaction service

[Review output]

[Second Prompt]: The transaction service looks good. Now add:
- Concurrent transaction handling (optimistic locking)
- Idempotency check (prevent duplicate transactions)
- Audit logging
- Performance optimization for bulk transactions

[Review output]

[Third Prompt]: Refactor to use async processing for audit logging
to avoid blocking the transaction flow
```

### 4. Constrain the Output

```
Create a React component for transaction history.

Constraints:
- Use TypeScript with strict mode
- Maximum 150 lines of code
- Use functional components with hooks (no classes)
- Must be accessible (ARIA labels)
- Mobile-first responsive design
- Include loading and error states
- Virtualize list for performance (react-window)

Do NOT:
- Use any external UI libraries (build from scratch)
- Use inline styles (use CSS modules)
- Make API calls directly (use provided custom hook)
```

### 5. Ask for Explanations

```
Explain this code and suggest improvements:

[PASTE CODE]

For each improvement:
1. What's the problem?
2. Why is it a problem?
3. How to fix it (with code)
4. What's the impact of the change?

Focus on:
- Performance
- Security
- Maintainability
- Scalability
```

---

## Domain-Specific Prompt Templates

### Learning New Concept

```
I need to learn [CONCEPT/TECHNOLOGY].

My background:
- [Your experience level]
- [Related technologies you know]
- [Learning style preference]

Teach me:
1. Core concepts (ELI5 explanation)
2. Comparison to [SIMILAR TECHNOLOGY I KNOW]
3. When to use vs not use
4. 3 progressive examples (basic → intermediate → advanced)
5. Common pitfalls and how to avoid
6. Resources for deeper learning

Make explanations practical with examples from [YOUR DOMAIN].
```

### Code Generation

```
Generate [COMPONENT/SERVICE/MODULE]:

Context:
- Project: [Description]
- Stack: [Technologies]
- Existing code: [Relevant parts]

Requirements:
- [Functional requirement 1]
- [Functional requirement 2]
- [...]

Quality Standards:
- SOLID principles
- Error handling for [specific scenarios]
- Logging at [appropriate points]
- Comments for complex logic only
- Type safety (TypeScript/Java)

Deliverables:
- Complete implementation
- Unit tests (80%+ coverage)
- Integration tests for [key flows]
- JSDoc/JavaDoc
- README with usage examples
```

### Debugging

```
I'm encountering an error:

Error Message:
```
[PASTE FULL ERROR]
```

Code Where Error Occurs:
```[language]
[PASTE RELEVANT CODE]
```

Context:
- What I'm trying to do: [Description]
- Environment: [OS, versions, dependencies]
- What I've tried: [List attempts]

Help me:
1. Diagnose root cause
2. Provide step-by-step fix
3. Explain why this happened
4. How to prevent similar errors
5. Best practices for this scenario
```

### Code Review

```
Review this code for a production banking system:

```[language]
[PASTE CODE]
```

Review Criteria:
1. Security (OWASP Top 10, data handling)
2. Performance (O(n) complexity, database queries, caching)
3. Reliability (error handling, edge cases, transaction safety)
4. Maintainability (SOLID, DRY, naming, structure)
5. Testing (testability, coverage gaps)
6. Banking-specific concerns (PCI compliance, audit trails, regulatory)

For each issue:
- Severity (Critical/High/Medium/Low)
- Explanation
- Fixed code
- Test to prevent regression

Also provide:
- Overall code quality score (0-100)
- Top 3 improvements with biggest impact
```

### System Design

```
Help me design a [SYSTEM/FEATURE]:

Requirements:
- Functional: [List]
- Non-functional:
  * Scale: [Users, requests/sec]
  * Availability: [SLA]
  * Latency: [Response time requirements]
  * Data: [Volume, growth rate]

Constraints:
- Budget: [If applicable]
- Tech stack: [Existing technologies to use]
- Team size: [Context]

Provide:
1. High-level architecture (components and interactions)
2. Data model (entities, relationships)
3. API design (endpoints, request/response)
4. Database choice and justification
5. Caching strategy
6. Scaling approach (horizontal/vertical)
7. Failure modes and mitigation
8. Security considerations
9. Monitoring and observability
10. Cost estimation
11. Trade-offs made and alternatives considered

Include diagrams (describe in text, I'll create visually).
```

---

## Prompt Optimization Techniques

### Technique 1: Few-Shot Learning

```
I need to generate API endpoint documentation in a specific format.

Examples of desired format:

### GET /api/v1/accounts/{accountId}
**Description**: Retrieve account details by ID
**Auth**: Required (Bearer token)
**Parameters**:
- `accountId` (path, required): UUID of account
**Response**: 200 OK
```json
{
  "id": "uuid",
  "accountNumber": "string",
  "balance": "number"
}
```
**Errors**:
- 404: Account not found
- 401: Unauthorized

---

Now document these endpoints following the same format:
[List endpoints]
```

### Technique 2: Chain of Thought

```
Solve this step-by-step, showing your reasoning:

Problem: Design database schema for multi-currency transactions
with support for real-time exchange rates.

Think through:
1. What entities are needed?
2. What are the relationships?
3. How to handle exchange rates (historical and current)?
4. How to ensure transaction consistency?
5. What indexes are needed for performance?
6. How to handle fractional currencies?

Show your thought process, then provide final schema.
```

### Technique 3: Role Playing

```
You are a senior software architect at a top fintech company with
10+ years experience in building high-scale payment systems.

Review this architecture for a payment processing system:
[DESCRIBE ARCHITECTURE]

Provide feedback as that senior architect would:
- What critical issues do you see?
- What will fail at scale?
- What's missing for production readiness?
- How would you redesign this?

Be direct and thorough. Assume I can handle honest criticism.
```

---

## Common Prompting Mistakes to Avoid

### Mistake 1: Too Vague
❌ "Make this code better"
✅ "Refactor this code to improve: 1) Performance (reduce O(n²) to O(n)), 2) Readability (extract helper functions), 3) Testability (dependency injection)"

### Mistake 2: Asking for Too Much at Once
❌ "Build a complete banking application with frontend, backend, database, AI features, deployment"
✅ [Break into phases, start with one component]

### Mistake 3: Not Providing Enough Context
❌ "This doesn't work. Fix it. [Code snippet]"
✅ "This payment processing code throws NullPointerException when amount is null. I expect it to throw InvalidAmountException instead. Here's the code, test case, and stack trace..."

### Mistake 4: Blindly Accepting Output
❌ [Copy-paste without review]
✅ [Review, test, understand, then modify as needed]

### Mistake 5: Not Iterating
❌ [Accept first response even if not perfect]
✅ [Refine: "This is close, but change X to Y, and add Z"]

---

# SUCCESS METRICS FRAMEWORK

## Week-by-Week Success Criteria

### Week 1: Environment & Foundations
**Must Have:**
- [ ] All dev tools installed and verified
- [ ] 5+ GitHub repositories created
- [ ] 20+ meaningful commits
- [ ] Portfolio website deployed

**Should Have:**
- [ ] Learning journal with daily entries
- [ ] First AI-generated project completed
- [ ] Comfortable with terminal/command line

**Metrics:**
- GitHub contributions: 7/7 days (green squares)
- Tools verification: 12/12 passed
- Time logged: 40-50 hours

---

### Weeks 2-4: Java/Spring Boot
**Must Have:**
- [ ] Spring Boot project with 15+ endpoints
- [ ] JPA entities with relationships
- [ ] Unit tests (70%+ coverage)
- [ ] Integration tests for critical flows
- [ ] Deployed microservice (with Docker)

**Should Have:**
- [ ] Spring Security implemented
- [ ] API documentation (OpenAPI)
- [ ] Database migrations (Flyway)
- [ ] Exception handling framework

**Metrics:**
- Test coverage: >70%
- API endpoints: 15+
- Response time: <200ms (p95)
- GitHub commits: 60+

---

### Weeks 5-6: Node.js & Python
**Must Have:**
- [ ] Express.js API with 10+ endpoints
- [ ] NestJS microservice
- [ ] FastAPI service with async endpoints
- [ ] All three stacks running together

**Metrics:**
- Multi-language proficiency demonstrated
- API gateway routing correctly
- Docker Compose working (one-command startup)

---

### Weeks 7-8: Frontend & Databases
**Must Have:**
- [ ] Next.js dashboard deployed
- [ ] React components (20+)
- [ ] TypeScript throughout
- [ ] Responsive design (mobile/tablet/desktop)
- [ ] 3 databases integrated (PostgreSQL, MongoDB, Redis)

**Metrics:**
- Lighthouse score: >90 (all categories)
- Database queries optimized
- Page load time: <2 seconds

---

### Weeks 9-10: AI Integration
**Must Have:**
- [ ] Gemini API integrated
- [ ] Claude API integrated
- [ ] RAG system working
- [ ] AI-powered feature in production

**Metrics:**
- AI response time: <3 seconds
- RAG retrieval accuracy: >85%
- Cost per request: <$0.05

---

### Weeks 11-12: MCP & Agents
**Must Have:**
- [ ] Custom MCP server built
- [ ] Agentic AI system working
- [ ] Multi-step workflows automated

**Metrics:**
- Agent success rate: >90%
- Tool execution accuracy: >95%
- Error recovery: Functional

---

### Week 13: Testing & DevOps
**Must Have:**
- [ ] CI/CD pipeline working
- [ ] Docker images optimized
- [ ] Monitoring dashboard setup
- [ ] Security scan passing

**Metrics:**
- Test coverage: >80%
- Build time: <10 minutes
- Docker image size: <500MB

---

### Weeks 14-16: Portfolio & Interview Prep
**Must Have:**
- [ ] 3 major projects completed
- [ ] GitHub profile polished
- [ ] Portfolio website updated
- [ ] 100 LeetCode problems solved
- [ ] 10 system design scenarios practiced

**Metrics:**
- GitHub: 300+ contributions over 16 weeks
- Portfolio projects: 3 production-ready
- Interview practice: 20+ mock interviews

---

## Portfolio Quality Checklist

### For Each Project

**Code Quality:**
- [ ] Follows SOLID principles
- [ ] Consistent code style (linter configured)
- [ ] Meaningful variable/function names
- [ ] No commented-out code
- [ ] No console.logs or debug statements
- [ ] Proper error handling

**Documentation:**
- [ ] Comprehensive README
- [ ] API documentation
- [ ] Architecture diagram
- [ ] Setup instructions (tested by someone else)
- [ ] Screenshots/GIFs
- [ ] License file

**Testing:**
- [ ] Unit tests (>70% coverage)
- [ ] Integration tests
- [ ] Tests actually run in CI
- [ ] All tests passing

**Deployment:**
- [ ] Deployed to production (accessible URL)
- [ ] Works on mobile devices
- [ ] Performance is acceptable
- [ ] No console errors
- [ ] SSL certificate valid

**GitHub:**
- [ ] Meaningful commit messages
- [ ] Commits are atomic (not huge changes)
- [ ] .gitignore configured properly
- [ ] No sensitive data in repo
- [ ] Issue/PR templates (for collaborative projects)

---

# APPENDIX: Resources & Templates

## Learning Resources

### Google Developer Program Resources

**Official Courses:**
1. **Google Cloud Skills Boost**: https://www.cloudskillsboost.google/
   - "Getting Started with Google Cloud"
   - "Build and Deploy Machine Learning Solutions"
   - "Generative AI for Developers"

2. **Google AI Courses**: https://developers.google.com/learn
   - "Introduction to Gemini API"
   - "Prompt Engineering Fundamentals"
   - "Building AI Applications with Gemini"

3. **Google Codelabs**: https://codelabs.developers.google.com/
   - Filter by: Web, Cloud, AI/ML
   - Hands-on tutorials (30-60 minutes each)

**Certification Paths:**
- Google Cloud Associate Cloud Engineer
- Google Cloud Professional Cloud Architect
- TensorFlow Developer Certificate (if pursuing ML further)

### Technology-Specific Resources

**Java/Spring Boot:**
- Spring Boot Documentation: https://spring.io/projects/spring-boot
- Baeldung (Spring tutorials): https://www.baeldung.com/
- Book: "Spring Boot in Action" by Craig Walls

**Node.js:**
- Node.js Documentation: https://nodejs.org/docs/
- "Node.js Design Patterns" by Mario Casciaro
- FreeCodeCamp Node.js course (YouTube)

**Python:**
- Real Python: https://realpython.com/
- "Effective Python" by Brett Slatkin
- FastAPI Documentation: https://fastapi.tiangolo.com/

**React/Next.js:**
- Next.js Documentation: https://nextjs.org/docs
- React Documentation: https://react.dev/
- Kent C. Dodds courses: https://kentcdodds.com/

**AI/ML:**
- Anthropic Claude Documentation: https://docs.anthropic.com/
- Google AI Studio: https://makersuite.google.com/
- LangChain Documentation: https://python.langchain.com/
- Prompt Engineering Guide: https://www.promptingguide.ai/

### Open Source Projects to Study

**Banking/Fintech:**
1. **Mifos X** (Core Banking): https://github.com/openMF/mifos-x
2. **Kill Bill** (Billing & Payments): https://github.com/killbill/killbill
3. **WePay** (Payment Gateway): https://github.com/wepay

**Full Stack Applications:**
1. **Cal.com** (Next.js): https://github.com/calcom/cal.com
2. **Formbricks** (Surveys): https://github.com/formbricks/formbricks
3. **Plane** (Project Management): https://github.com/makeplane/plane

**AI Applications:**
1. **PrivateGPT**: https://github.com/imartinez/privateGPT
2. **LangChain Examples**: https://github.com/langchain-ai/langchain
3. **Vercel AI SDK**: https://github.com/vercel/ai

---

## Code Templates

### Spring Boot Project Template

Repository: https://github.com/spring-projects/spring-boot
Starter: https://start.spring.io/

**Recommended Structure** (in your GitHub):
```
spring-boot-starter-template/
├── src/main/java/
│   └── com/yourname/template/
│       ├── config/
│       ├── controller/
│       ├── service/
│       ├── repository/
│       ├── model/
│       │   ├── entity/
│       │   └── dto/
│       ├── exception/
│       └── TemplateApplication.java
├── src/main/resources/
├── src/test/
├── Dockerfile
├── docker-compose.yml
├── pom.xml
└── README.md
```

### Next.js Project Template

Template: https://github.com/vercel/next.js/tree/canary/examples

**Recommended Starting Point**:
- Use: `npx create-next-app@latest --example with-tailwindcss`
- Or: shadcn/ui starter: https://ui.shadcn.com/docs/installation

---

## Useful GitHub Repositories

### Learning Roadmaps
1. **Developer Roadmaps**: https://github.com/kamranahmedse/developer-roadmap
2. **System Design Primer**: https://github.com/donnemartin/system-design-primer
3. **Coding Interview University**: https://github.com/jwasham/coding-interview-university

### Awesome Lists
1. **Awesome Spring Boot**: https://github.com/stunstunstun/awesome-spring-boot
2. **Awesome Node.js**: https://github.com/sindresorhus/awesome-nodejs
3. **Awesome Python**: https://github.com/vinta/awesome-python
4. **Awesome React**: https://github.com/enaqx/awesome-react
5. **Awesome AI**: https://github.com/owainlewis/awesome-artificial-intelligence

### Tools & Utilities
1. **GitHub README Stats**: https://github.com/anuraghazra/github-readme-stats
2. **Shields.io** (badges): https://shields.io/
3. **Carbon** (code screenshots): https://carbon.now.sh/

---

## Job Search Resources

### Job Boards
- **LinkedIn Jobs**: (Filter: Java, Node.js, Python, AI, Full Stack)
- **AngelList**: (Startups)
- **BuiltIn**: (Tech companies)
- **Wellfound**: (Startups, remote)

### Company Lists (Banking/Fintech)
- JPMorgan Chase (Tech divisions)
- Goldman Sachs (Engineering)
- Stripe, Square, PayPal
- Plaid, Chime, Affirm
- Robinhood, Coinbase

### Resume Templates
- **Jake's Resume**: https://www.overleaf.com/latex/templates/jakes-resume/syzfjbzwjncs
- **ATS-Friendly Templates**: Search "ATS resume template GitHub"

---

## Daily/Weekly Templates

### Daily Learning Journal Template

```markdown
# [Date] - Day X

## 🎯 Today's Goals
- [ ] Goal 1
- [ ] Goal 2
- [ ] Goal 3

## 📚 What I Learned
### Technical Skills
- Concept 1: [Brief explanation]
- Concept 2: [Brief explanation]

### Key Takeaways
1. Insight 1
2. Insight 2

## 💻 Code Written
- Project: [Name]
- Files: [List]
- Commits: [Number]
- Lines of code: [Approximate]

## 🚧 Challenges Faced
**Challenge 1**: [Description]
- How I solved it: [Solution]
- What I learned: [Insight]

## 🤖 AI Prompts Used
1. **Prompt**: "[Full prompt]"
   - **Result**: [Summary]
   - **Usefulness**: [Rating 1-5]

## 📝 Notes
[Any additional notes, ideas, or thoughts]

## ⏰ Time Spent
- Learning: X hours
- Coding: X hours
- Debugging: X hours
- Documentation: X hours
**Total**: X hours

## 🎯 Tomorrow's Plan
1. Task 1
2. Task 2
3. Task 3
```

### Weekly Review Template

```markdown
# Week X Review ([Date Range])

## 🏆 Achievements
- Completed: [List]
- Learned: [Key technologies/concepts]
- Built: [Projects/features]

## 📊 Metrics
- GitHub contributions: X commits
- Lines of code: ~X
- Tests written: X
- Total hours: X

## 💡 Key Learnings
1. Technical: [Most important technical learning]
2. Process: [Workflow improvement]
3. Personal: [Soft skill or personal insight]

## 🎯 Goals Review
- Goals met: X/Y
- Partially met: [List with reasons]
- Not met: [List with analysis]

## 📈 Progress Against Program
- On track: [Yes/No]
- Ahead/Behind: [By how much]
- Adjustments needed: [Any course corrections]

## 🔄 Next Week's Focus
1. Priority 1
2. Priority 2
3. Priority 3

## 🤔 Reflections
[Free-form reflection on the week]
```

---

## Conclusion

This training program is comprehensive and demanding, but completely achievable with dedication and consistent effort. Remember:

1. **Use AI as a force multiplier**, not a crutch
2. **Build in public** (GitHub, Twitter/X, LinkedIn)
3. **Focus on understanding**, not just completion
4. **Quality over quantity** in portfolio projects
5. **Network actively** (comment on posts, contribute to discussions)
6. **Document everything** (future you will thank present you)
7. **Be patient with yourself** (learning takes time)

### Final Success Metrics (End of 16 Weeks)

**Technical Skills:**
- [ ] Can build full-stack application independently in 3 stacks
- [ ] Can integrate AI meaningfully into applications
- [ ] Can deploy applications to production
- [ ] Can write comprehensive tests
- [ ] Can design scalable systems

**Portfolio:**
- [ ] 3 production-ready projects
- [ ] GitHub profile shows consistent contributions
- [ ] Portfolio website showcases skills
- [ ] LinkedIn reflects new skills

**Interview Readiness:**
- [ ] Solved 100+ coding problems
- [ ] Can design 10+ systems confidently
- [ ] Has compelling story for transition
- [ ] Can discuss projects in depth
- [ ] Has prepared answers for common questions

**Job Search:**
- [ ] Resume updated and ATS-friendly
- [ ] LinkedIn profile optimized
- [ ] Applied to 20+ relevant positions
- [ ] Networking actively
- [ ] Attending tech meetups/events

---

**You've got this! 🚀**

Start Week 1 tomorrow. Document everything. Build in public. The journey from technology leader to hands-on full-stack AI engineer is challenging but incredibly rewarding.

Questions or need clarification on any section? Ask! That's what AI assistants are here for.

Good luck on your transformation journey!

---

**Document Version**: 1.0
**Last Updated**: January 18, 2026
**Created for**: Technology Leaders Transitioning to Full Stack AI Engineering
