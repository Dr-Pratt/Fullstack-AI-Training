# How to Use Gemini & Claude When Stuck
## Complete Guide for AI-Assisted Problem Solving

---

## 🎯 Philosophy: AI as Learning Partner, Not Just Answer Provider

**Wrong Approach** ❌:
```
"How do I fix this error?"
[Copy-paste error]
[Copy-paste code from AI]
[Don't understand what was fixed]
```

**Right Approach** ✅:
```
"I'm getting this error. Here's what I think is happening... Am I right?
Here's what I've tried... Why didn't that work?
Now help me understand the root cause, then we'll fix it together."
```

**Remember**: The goal is LEARNING, not just getting unstuck.

---

## 📚 Table of Contents

1. [When to Use Gemini vs Claude](#when-to-use-gemini-vs-claude)
2. [Scenario-Based Prompting Guides](#scenario-based-prompting-guides)
3. [Step-by-Step Problem-Solving Framework](#problem-solving-framework)
4. [Common Situations & Exact Prompts](#common-situations)
5. [Advanced Techniques](#advanced-techniques)
6. [Avoiding Common Pitfalls](#avoiding-pitfalls)

---

## When to Use Gemini vs Claude

### Google Gemini (Recommended For)

**Use Gemini when you need:**

1. **Broad conceptual understanding**
   - Learning a new technology from scratch
   - Understanding how systems work at a high level
   - Comparing multiple approaches
   - Multi-step learning (large context window)

2. **Research and exploration**
   - "What are the best practices for..."
   - "Compare X vs Y vs Z"
   - "Explain the ecosystem around..."
   - Finding resources and tutorials

3. **Visual/multimodal understanding**
   - Uploading architecture diagrams for explanation
   - Analyzing screenshots of errors
   - Understanding visual documentation

4. **Long-form content**
   - Tutorial generation
   - Study guides
   - Comprehensive explanations
   - Step-by-step learning paths

**Example Gemini Prompt**:
```
I'm learning Spring Boot 3.x and I'm confused about the difference between
@Component, @Service, @Repository, and @Controller annotations.

My background: 15 years with Spring 4.x (XML-based config)

Explain:
1. What each annotation does (and why we have 4 instead of just @Component)
2. When to use each one (with decision tree)
3. What happens behind the scenes (component scanning, bean creation)
4. Show me a complete example of each in a banking application
5. Common mistakes developers make with these annotations

Make it relevant to banking/fintech domain.
```

---

### Anthropic Claude (Recommended For)

**Use Claude when you need:**

1. **Code generation and refactoring**
   - Writing new features
   - Refactoring existing code
   - Code reviews
   - Implementing complex algorithms

2. **Deep reasoning and debugging**
   - Complex error diagnosis
   - Performance optimization
   - Security analysis
   - Architecture decisions

3. **Specific, actionable solutions**
   - "Fix this bug"
   - "Optimize this code"
   - "Review this implementation"
   - "Generate tests for this function"

4. **Tool use and function calling**
   - Database queries
   - API calls
   - File operations
   - Multi-step workflows

**Example Claude Prompt**:
```
Review this Spring Boot service class for production readiness:

```java
[YOUR CODE HERE]
```

Analyze for:
1. Security vulnerabilities (OWASP Top 10, especially relevant to banking)
2. Performance issues (N+1 queries, unnecessary object creation, etc.)
3. Concurrency problems (race conditions, especially in transaction processing)
4. Error handling gaps
5. Testing gaps

For each issue:
- Severity (Critical/High/Medium/Low)
- Detailed explanation of the problem
- Fixed code
- Test case to prevent regression
- Best practice explanation

Focus on banking/fintech production concerns (PCI compliance, audit logging, etc.).
```

---

## Problem-Solving Framework

### 5-Step Framework for Using AI When Stuck

#### Step 1: Define the Problem Clearly (5 minutes)

**Before asking AI, write down:**

1. **What you're trying to do**: [Specific goal]
2. **What's happening instead**: [Actual behavior]
3. **What you expected**: [Expected behavior]
4. **What you've tried**: [Attempts made]
5. **What you think might be wrong**: [Your hypothesis]

**Example**:
```
1. Goal: Save a User entity to PostgreSQL database
2. Happening: Getting NullPointerException
3. Expected: User saved successfully, return User object with generated ID
4. Tried:
   - Checked database connection (works)
   - Added @Transactional annotation
   - Verified User entity has @Entity annotation
5. Hypothesis: Maybe the repository isn't being injected properly?
```

#### Step 2: Try to Solve It Yourself (10-15 minutes)

**Don't immediately go to AI. Try:**

1. **Read the error message carefully** (line by line)
2. **Check official documentation** (Spring, React, etc.)
3. **Add debug logging** (see what values variables have)
4. **Google the exact error** (someone else probably hit this)
5. **Check your assumptions** (is the database running? Is the port correct?)

**Why this matters**:
- You learn problem-solving skills
- You understand the context better
- Your AI prompt will be more specific
- Some problems have simple solutions

#### Step 3: Formulate a Detailed Prompt

**Use the CEDAR framework:**

- **C**ontext: Your background, project setup, what you're building
- **E**rror/Issue: Specific problem with error messages, stack traces
- **D**etails: Relevant code, configuration, environment
- **A**ttempts: What you've already tried
- **R**equest: What specific help you need

**Template**:
```
Context:
I'm building a [PROJECT DESCRIPTION] using [TECHNOLOGIES].
My background: [EXPERIENCE LEVEL].
Current module: [WHAT PART OF PROJECT].

Error/Issue:
I'm encountering [PROBLEM DESCRIPTION].

Error message:
```
[FULL ERROR MESSAGE/STACK TRACE]
```

Details:
Here's the relevant code:

```[language]
[PASTE CODE - be selective, not entire file]
```

Configuration:
- [Relevant config: application.yml, package.json, etc.]

Environment:
- OS: [Mac/Windows/Linux]
- [Technology] version: [Version]

What I've tried:
1. [Attempt 1] - Result: [What happened]
2. [Attempt 2] - Result: [What happened]
3. [Attempt 3] - Result: [What happened]

Request:
Please help me:
1. Understand the root cause of this error
2. Provide a step-by-step fix
3. Explain why my attempts didn't work
4. Show me how to prevent this in the future
5. Suggest best practices for this scenario
```

#### Step 4: Iterate with AI (Conversation)

**Don't stop at first response!**

**After AI's response:**
```
"Thanks! That makes sense. Can you clarify [SPECIFIC PART]?

Also, you suggested [SOLUTION]. How does that compare to [ALTERNATIVE APPROACH]?
Which is better for a production banking system and why?"
```

**If solution works:**
```
"That fixed it! Now help me understand:
1. Why did that work?
2. What was fundamentally wrong with my original code?
3. How can I recognize this pattern in the future?
4. What tests should I write to prevent this regression?"
```

**If solution doesn't work:**
```
"I tried that, but now I'm getting a different error:

[NEW ERROR]

Here's the updated code:

```[language]
[UPDATED CODE]
```

What am I still missing?"
```

#### Step 5: Document the Learning

**After solving the problem, write in your journal:**

```markdown
## Problem: [Brief title]

**Error**: [Error message]

**Root Cause**: [What was actually wrong]

**Solution**: [How it was fixed]

**Key Learning**: [What I learned that I can apply to future problems]

**AI Prompts That Worked**:
1. [Effective prompt 1]
2. [Effective prompt 2]

**Prevention**: [How to avoid this in the future]
```

---

## Scenario-Based Prompting Guides

### Scenario 1: "I Don't Understand This Concept"

**Situation**: You're reading documentation or tutorial and a concept doesn't make sense.

**Gemini Prompt**:
```
I'm learning [TECHNOLOGY/CONCEPT] and I'm confused about [SPECIFIC CONCEPT].

Context:
- My background: [Your experience]
- What I already know: [Related knowledge]
- Where I encountered this: [Documentation, tutorial, code example]

The part I don't understand:
"[QUOTE THE CONFUSING PART]"

Help me understand:
1. Explain this concept in simple terms (ELI5 version)
2. Compare it to [SOMETHING I ALREADY KNOW] - how is it similar/different?
3. Why does this concept exist? What problem does it solve?
4. Show me a concrete example using [MY DOMAIN - banking/fintech]
5. What are the common misconceptions about this concept?
6. Give me a practical exercise to solidify this understanding

I learn best through: [examples / analogies / diagrams / hands-on coding]
```

**Example**:
```
I'm learning React hooks and I'm confused about useEffect's dependency array.

Context:
- Background: 15 years Java backend, new to React
- I understand: useState, basic components, props
- Where: React documentation on useEffect

The part I don't understand:
"If you want to run an effect and clean it up only once (on mount and unmount),
you can pass an empty array ([]) as a second argument."

Help me understand:
1. Explain dependency array in simple terms
2. Compare it to Java lifecycle methods (componentDidMount, etc.) - how similar?
3. Why does the dependency array exist? What problem does it solve?
4. Show me examples: empty array, with dependencies, no array
5. Common mistakes with dependency array
6. Exercise: Build a component that fetches user account data on mount

I learn best through concrete code examples.
```

---

### Scenario 2: "My Code Has an Error"

**Situation**: You're getting an error and don't know why.

**Claude Prompt** (Step-by-step):

**First, gather information:**
```bash
# Get full stack trace (don't truncate)
# Note: Your IDE usually shows this

# Check versions
java --version  # or node --version, python --version
mvn --version   # or npm --version, pip --version

# Verify environment
echo $SPRING_PROFILES_ACTIVE
# or any relevant environment variables
```

**Then, prompt Claude:**
```
I'm encountering an error in my [TECHNOLOGY] application.

Context:
- Project: [Description]
- Technology stack: [List with versions]
- What I was doing: [Specific action that caused error]

Error Message:
```
[PASTE COMPLETE ERROR MESSAGE AND STACK TRACE]
```

Relevant Code:
```[language]
// File: [filename.java]
[PASTE THE CODE WHERE ERROR OCCURS]
```

Related Configuration:
```yaml
# application.yml (or relevant config)
[PASTE RELEVANT CONFIG]
```

Environment:
- OS: [macOS 14.2 / Windows 11 / Ubuntu 22.04]
- Java/Node/Python version: [X.X]
- Database: [PostgreSQL 16 / MongoDB 7]
- Running via: [IDE / command line / Docker]

What I've Tried:
1. [Checked database is running - it is]
2. [Verified entity has @Entity annotation - it does]
3. [Added null checks - still fails]
4. [Googled error message - found similar issues but solutions didn't work]

My Hypothesis:
[I think it might be related to transaction management because...]

Please:
1. Diagnose the root cause (explain what's actually wrong)
2. Explain why this error is happening
3. Provide step-by-step fix with code
4. Explain why my attempts didn't work
5. Give me a test to verify the fix
6. Advise how to prevent this in the future
```

---

### Scenario 3: "How Do I Implement This Feature?"

**Situation**: You know what you want to build but don't know how to start.

**Gemini Prompt** (for understanding approach):
```
I need to implement [FEATURE] in my [PROJECT TYPE] application.

Context:
- Current stack: [Technologies]
- Existing architecture: [Brief description]
- Constraints: [Performance, security, etc.]

Feature Requirements:
1. [Requirement 1]
2. [Requirement 2]
3. [Requirement 3]

I'm unsure about:
- [Concern 1: e.g., "Best way to structure this"]
- [Concern 2: e.g., "Which library/approach to use"]
- [Concern 3: e.g., "How to test this"]

Help me:
1. Understand the different approaches (pros/cons of each)
2. Recommend the best approach for my situation (with rationale)
3. Break down implementation into steps
4. Identify potential pitfalls
5. Suggest testing strategy

Then I'll ask Claude to help me implement it.
```

**Claude Prompt** (for actual implementation):
```
I'm implementing [FEATURE] using [RECOMMENDED APPROACH from Gemini].

Project Context:
- Stack: [Technologies]
- Existing code structure:
  ```
  [SHOW RELEVANT DIRECTORY STRUCTURE]
  ```

Existing related code:
```[language]
[PASTE RELEVANT EXISTING CODE]
```

Feature Requirements:
[DETAILED REQUIREMENTS]

Implementation Plan (from my research):
1. [Step 1]
2. [Step 2]
3. [Step 3]

Please provide:
1. Complete implementation code for [SPECIFIC COMPONENT/SERVICE]
2. Following my existing code patterns
3. With comprehensive error handling
4. Including input validation
5. With logging at appropriate levels
6. Using [SPECIFIC LIBRARY/FRAMEWORK VERSION]

Code Quality Requirements:
- Follow SOLID principles
- Production-ready (not demo code)
- Secure (especially for banking context)
- Performant (expected load: [X requests/sec])

Also provide:
- Unit tests (JUnit 5 / Jest / pytest)
- Integration test for happy path
- Documentation comments
```

---

### Scenario 4: "This Code Works But I Don't Know If It's Good"

**Situation**: Your code runs, but you want to know if it's production-quality.

**Claude Prompt**:
```
I've implemented [FEATURE] and it's working, but I want to ensure it's production-ready.

Code:
```[language]
[PASTE YOUR CODE - CAN BE LONGER FOR REVIEW]
```

Context:
- This is for: [Banking transaction processing / User authentication / etc.]
- Expected usage: [1000 requests/sec / 10 users / etc.]
- Criticality: [High - handles money / Medium / Low]

Please review for:

1. **Security**
   - Vulnerabilities (OWASP Top 10)
   - Data validation and sanitization
   - Authentication/authorization gaps
   - Sensitive data handling
   - Banking-specific security (PCI DSS considerations)

2. **Performance**
   - Algorithmic complexity (Big O)
   - Database query optimization
   - Memory usage
   - Unnecessary object creation
   - Caching opportunities

3. **Reliability**
   - Error handling completeness
   - Edge cases not covered
   - Potential null pointer exceptions
   - Race conditions (concurrent access)
   - Transaction management (especially for financial operations)

4. **Code Quality**
   - SOLID principles violations
   - Code smells
   - Naming conventions
   - Complexity (methods too long?)
   - Duplication (DRY violations)

5. **Testing**
   - What's missing in test coverage?
   - Suggest test cases I haven't thought of

6. **Best Practices**
   - Language/framework-specific best practices
   - Design pattern applications
   - Industry standards (especially banking/fintech)

For each issue found:
- **Severity**: Critical / High / Medium / Low
- **Problem**: What's wrong and why it matters
- **Fix**: Refactored code
- **Test**: How to test the fix
- **Learning**: Best practice explanation

Finally:
- Overall code quality score (0-100)
- Top 3 improvements with biggest impact
- Recommended refactoring plan
```

---

### Scenario 5: "My Tests Are Failing"

**Situation**: You wrote tests but they're not passing.

**Claude Prompt**:
```
My [unit/integration/e2e] tests are failing and I'm not sure why.

Test Code:
```[language]
[PASTE TEST CODE]
```

Code Being Tested:
```[language]
[PASTE IMPLEMENTATION CODE]
```

Test Failure Output:
```
[PASTE FULL TEST FAILURE MESSAGE]
```

What I expect:
[Describe expected behavior]

What's happening:
[Describe actual behavior]

Testing setup:
- Framework: [JUnit 5 / Jest / pytest]
- Mocking: [Mockito / jest.mock / pytest-mock]
- Test database: [H2 / TestContainers / Mock]

Questions:
1. Why is this test failing? (root cause)
2. Is my test wrong or is my code wrong?
3. How should I fix it?
4. Am I testing the right thing?
5. Are there edge cases I'm missing?
6. Is this test properly isolated (not dependent on external state)?

Help me:
- Fix the failing test
- Improve test quality
- Add missing test cases
- Follow testing best practices ([AAA pattern / Given-When-Then / etc.])
```

---

### Scenario 6: "Performance Is Slow"

**Situation**: Your application is running slower than expected.

**Step 1: Gather Data** (Do this before asking AI)
```bash
# For Spring Boot
# Add to application.yml:
spring:
  jpa:
    show-sql: true
    properties:
      hibernate:
        format_sql: true

# For Node.js
console.time('operation-name');
// your code
console.timeEnd('operation-name');

# For Python
import time
start = time.time()
# your code
end = time.time()
print(f"Execution time: {end - start} seconds")
```

**Step 2: Claude Prompt**
```
My [ENDPOINT/FUNCTION/PAGE] is performing slower than expected.

Performance Metrics:
- Current: [X seconds / X ms]
- Expected: [Y seconds / Y ms]
- Tested with: [Load conditions: concurrent users, data volume]

Code:
```[language]
[PASTE CODE]
```

Database Queries (from logs):
```sql
[PASTE SQL QUERIES BEING EXECUTED]
```

Profiling Results (if you have them):
[PASTE PROFILER OUTPUT - or describe bottleneck if you identified it]

Environment:
- Database: [PostgreSQL with X rows]
- Server: [Local / Cloud specs]
- Network: [LAN / Internet]

Help me:
1. Identify performance bottlenecks
2. Explain why each bottleneck exists
3. Provide optimized code
4. Suggest caching strategy (if applicable)
5. Recommend database indexes (if needed)
6. Advise on load testing to verify improvements

Focus on:
- Database query optimization (N+1 queries, missing indexes)
- Algorithm optimization (reduce O(n²) to O(n))
- Caching opportunities (Redis)
- Unnecessary network calls
- Large object creation/serialization
```

---

### Scenario 7: "How Do I Deploy This?"

**Situation**: Code works locally, need to deploy to production.

**Gemini Prompt** (for deployment strategy):
```
I need to deploy my [APPLICATION TYPE] to production.

Application Details:
- Stack: [Frontend: Next.js, Backend: Spring Boot, Database: PostgreSQL]
- Expected traffic: [Users, requests/sec]
- Budget: [Free tier / ~$50/month / etc.]
- Uptime requirement: [99% / 99.9%]

Current Setup:
- Running on: [localhost currently]
- Database: [local PostgreSQL]
- External services: [Gemini API, etc.]

Questions:
1. What deployment platforms do you recommend? (Vercel, Railway, AWS, etc.)
2. Compare pros/cons of each for my use case
3. What's the deployment architecture? (monolith vs microservices)
4. How to handle environment variables and secrets?
5. How to set up CI/CD?
6. What monitoring should I add?
7. How to handle database migrations in production?
8. Cost estimation for each platform

Help me choose the best option and understand the deployment process.
```

**Claude Prompt** (for actual deployment):
```
I'm deploying my [APPLICATION] to [CHOSEN PLATFORM].

Application:
- Frontend: [Next.js app]
- Backend: [Spring Boot API]
- Database: [PostgreSQL]

Deployment platform: [Railway / Vercel / AWS / etc.]

I need:
1. **Dockerfile** for backend (multi-stage build, optimized)
2. **Docker Compose** for local testing
3. **GitHub Actions workflow** for CI/CD
   - Run tests on PR
   - Deploy to staging on merge to develop
   - Deploy to production on merge to main
4. **Environment variable management**
   - What variables I need
   - How to set them securely
5. **Database migration strategy**
   - How to run Flyway/Liquibase migrations on deployment
6. **Health checks and monitoring**
   - Endpoints to create
   - What to monitor
7. **Deployment documentation**
   - Step-by-step deployment guide
   - Rollback procedure
   - Common issues and solutions

Provide complete, production-ready configuration files.
```

---

### Scenario 8: "I Need to Integrate With an API"

**Situation**: You need to call an external API (Gemini, payment gateway, etc.)

**Gemini Prompt** (to understand the API):
```
I need to integrate [API NAME] into my [APPLICATION].

API Documentation: [Link if available]

Use Case:
- What I need to do: [e.g., "Process payment", "Analyze text with AI"]
- Frequency: [e.g., "Every transaction", "On user request"]
- Data flow: [What data I send, what I receive]

Questions:
1. How does this API work? (authentication, rate limits, pricing)
2. Best practices for using this API
3. Error handling strategies
4. Rate limiting and retry logic
5. Security considerations (API key management)
6. Testing strategies (sandbox environment, mocking)
7. Cost optimization tips

Help me understand the API before I implement integration.
```

**Claude Prompt** (for implementation):
```
I need to implement integration with [API NAME].

API Details:
- Endpoint: [URL]
- Authentication: [API key / OAuth / JWT]
- Documentation: [Link]

Use Case:
[Describe what you're trying to do]

My Application Context:
- Language: [Java / Node.js / Python]
- Framework: [Spring Boot / Express / FastAPI]
- Existing architecture: [Brief description]

Requirements:
1. Service class to handle API calls
2. Proper error handling (API errors, network errors, timeouts)
3. Retry logic with exponential backoff
4. Rate limiting (respect API limits)
5. Logging (requests and responses for debugging)
6. Configuration (API key from environment variables)
7. Unit tests (with mocked API responses)
8. Integration tests (with API sandbox if available)

Provide:
- Complete service implementation
- Configuration setup
- Error handling strategy
- Test examples
- Best practices for production use

Specific concerns for banking application:
- [Data security, PCI compliance if relevant, audit logging]
```

---

## Advanced Techniques

### Technique 1: Chain of Thought Prompting

**For complex problems, ask AI to think step-by-step:**

```
I need to design a fraud detection system for real-time transactions.

Don't give me the solution yet. First, think through:

1. What are the key components needed?
2. What data do we need to collect?
3. What are the different approaches we could take?
4. What are the trade-offs of each approach?
5. What are the potential failure modes?
6. How do we measure success?

Show your reasoning for each step. Then, once we've thought it through,
provide the recommended implementation.
```

**Why this works**: You see the reasoning process, not just the answer.

---

### Technique 2: Iterative Refinement

**Don't accept the first response. Iterate:**

```
[Initial AI Response]

Your response:
"Good start, but let's refine this:

1. The error handling is too broad. Show me specific exception types for
   database errors vs validation errors vs network errors.

2. The logging is minimal. Add structured logging with relevant context
   (transaction ID, customer ID, timestamps).

3. The test coverage is basic. Add edge cases: null inputs, very large
   amounts, concurrent transactions.

Update the code with these improvements."
```

---

### Technique 3: Asking for Alternatives

**Don't settle for one approach:**

```
"You suggested using Redis for caching. What are the alternatives?

Compare:
- Redis
- In-memory cache (Caffeine for Java)
- Database query optimization
- CDN caching (for frontend)

For each:
- Pros and cons
- When to use
- Cost implications
- Complexity

For my banking dashboard use case, which would you recommend and why?"
```

---

### Technique 4: Reality Check

**Ask AI to critique its own suggestions:**

```
"You suggested [SOLUTION]. Now critique it:

1. What could go wrong with this approach in production?
2. What edge cases might this not handle?
3. What are the scalability limits?
4. What security vulnerabilities might exist?
5. What's the maintenance burden of this solution?

Be brutally honest. What am I not seeing?"
```

---

### Technique 5: Learning, Not Just Solving

**After getting a solution:**

```
"Thanks, that fixed it! Now teach me:

1. WHY did that work? Explain the underlying mechanism.
2. How would I have debugged this myself? What should I have looked for?
3. How can I recognize this pattern in the future?
4. What mental model should I build to understand this concept?
5. Are there similar patterns I should learn about?

Help me learn to fish, not just give me a fish."
```

---

## Avoiding Common Pitfalls

### Pitfall 1: Copy-Pasting Without Understanding

**❌ Don't do this:**
```
[Get code from AI]
[Paste into project]
[It works!]
[Move on without understanding]
```

**✅ Do this instead:**
```
[Get code from AI]
[Read every line]
[For each line you don't understand, ask: "What does this line do and why?"]
[Modify variable names to match your project]
[Add comments explaining your understanding]
[Write tests to verify behavior]
[Only then integrate into project]
```

---

### Pitfall 2: Not Providing Enough Context

**❌ Vague prompt:**
```
"How do I save data to database?"
```

**✅ Specific prompt:**
```
"I'm using Spring Boot 3.2 with JPA and PostgreSQL. I need to save a User
entity with these fields: [list fields]. I've created the entity with @Entity
annotation and a JpaRepository. When I call repository.save(user), I get
NullPointerException. Here's my code: [paste code]. What am I missing?"
```

---

### Pitfall 3: Asking One Big Question Instead of Breaking It Down

**❌ Overwhelming question:**
```
"Build me a complete banking application with frontend, backend, database,
authentication, payments, fraud detection, and AI chatbot."
```

**✅ Incremental approach:**
```
Step 1: "Help me design the database schema for accounts and transactions"
Step 2: "Now help me implement the Account entity in Spring Boot"
Step 3: "Now help me create REST endpoints for account operations"
[Continue step by step]
```

---

### Pitfall 4: Not Verifying AI Responses

**Remember: AI can make mistakes!**

**Always:**
1. **Test the code** - Don't assume it works
2. **Read documentation** - Verify AI's claims
3. **Check versions** - AI might reference outdated syntax
4. **Question confidently wrong answers** - If something feels off, it might be
5. **Use multiple sources** - Ask both Gemini and Claude for important decisions

**Example of catching AI error:**
```
You: "This code you gave me doesn't compile. The method `findByEmail` doesn't
exist on JpaRepository. Did you mean I should create it in my repository interface?"

AI: "You're absolutely right, my apologies. You need to add this method to your
repository interface: [correct code]"
```

---

### Pitfall 5: Using AI as a Crutch

**❌ Bad habit:**
- Every small problem → immediately ask AI
- Never struggle or think independently
- Don't build problem-solving muscles

**✅ Healthy habit:**
- Try to solve for 10-15 minutes first
- Use AI when genuinely stuck or to learn deeper
- Use AI to verify your solution, not just get the solution
- Graduate to using AI less over time for basic problems

---

## Emergency Troubleshooting Prompts

### When Nothing Works

```
I've been stuck on this for [X hours] and nothing is working.

The Problem:
[Clear description]

Everything I've Tried:
1. [Attempt 1] → [Result]
2. [Attempt 2] → [Result]
3. [Attempt 3] → [Result]
4. [Attempt 4] → [Result]

Current Error:
```
[ERROR]
```

Full Code:
```[language]
[PASTE MORE CODE THAN USUAL - GIVE FULL CONTEXT]
```

Environment Details:
[EVERY VERSION, CONFIGURATION DETAIL]

I'm at a loss. Can you:
1. Analyze what I might be fundamentally misunderstanding
2. Suggest a completely different approach if needed
3. Help me debug systematically
4. Point out if I'm even trying to solve the right problem
```

---

## Quick Reference: Prompt Starters

### For Learning
```
"I'm learning [X]. My background is [Y]. Explain [concept] by comparing it to [something I know]..."
```

### For Debugging
```
"I'm getting [error] when [doing X]. I've tried [A, B, C]. Here's my code: [code]. Help me understand why..."
```

### For Implementation
```
"I need to implement [feature] using [tech]. Requirements: [list]. Show me production-ready code with [specific needs]..."
```

### For Code Review
```
"Review this [language] code for [security/performance/best practices]. Context: [banking/production/etc.]. Here's the code: [code]..."
```

### For Architecture
```
"Help me design [system]. Scale: [numbers]. Requirements: [list]. Compare approaches and recommend best for [context]..."
```

---

## Final Tips

### 1. Keep a Prompt Library
Save prompts that worked well:
```markdown
# My Effective Prompts

## Debugging Spring Boot JPA Issues
[Your best prompt template]

## React Component Code Review
[Your best prompt template]

## Understanding New Concepts
[Your best prompt template]
```

### 2. Iterate and Improve Prompts
If a prompt doesn't give good results:
- Add more context
- Be more specific
- Break into smaller questions
- Try different AI (Gemini vs Claude)

### 3. Learn Patterns, Not Solutions
Focus on understanding:
- Why this solution works
- When to apply this pattern
- How to recognize similar problems
- What alternatives exist

### 4. Build Gradually
Don't try to understand everything at once:
- Get something working (even if not perfect)
- Understand one layer at a time
- Iterate and improve
- Refactor with knowledge

### 5. Trust But Verify
- AI is a powerful tool, not an oracle
- Test everything
- Read documentation
- Develop your own judgment

---

## Remember

**The goal is not to become dependent on AI.**

**The goal is to:**
- Learn faster with AI as a tutor
- Build production-quality code
- Understand deeply, not superficially
- Become an independent engineer who happens to use AI tools

**You're not cheating by using AI. You're learning smarter.**

Just like developers use Google, Stack Overflow, and documentation,
you're using AI as another tool in your learning toolkit.

The key is to **learn** from it, not just **copy** from it.

---

**Good luck with your learning journey! 🚀**

When you get stuck, refer back to this guide.
Save prompts that work.
Keep learning.
Keep building.

You've got this! 💪

---

**Document Version**: 1.0
**Last Updated**: January 18, 2026
**Part of**: Full Stack AI Engineer Training Program
