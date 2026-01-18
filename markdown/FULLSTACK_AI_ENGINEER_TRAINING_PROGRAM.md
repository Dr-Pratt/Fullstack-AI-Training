# Full Stack AI Engineer Training Program
## From Technology Leadership to Hands-On Engineering Excellence

---

## 📋 Program Overview

**Target Audience**: Technology managers/leaders with 15+ years experience (Java, Banking/Fintech domain)
**Goal**: Transform into production-ready Full Stack AI Engineer
**Timeline**: 16 weeks (3-4 months) intensive, 40+ hours/week
**Outcome**: Job-ready with portfolio, AI expertise, and modern engineering practices

### Core Technologies Covered
- **Backend**: Java (Spring Boot), Node.js (Express, NestJS), Python (FastAPI, Django)
- **Frontend**: React, TypeScript, Next.js, Tailwind CSS
- **Databases**: PostgreSQL, MongoDB, Redis, Vector DBs (Pinecone, Weaviate)
- **AI/ML**: Google Gemini, Claude AI, LangChain, RAG systems, AI Agents
- **DevOps**: Docker, Kubernetes, CI/CD, Cloud deployment (GCP, AWS)
- **Testing**: JUnit, Jest, Pytest, Cypress, Test-Driven Development
- **Tools**: Claude Code, VS Code, Git, GitHub Actions

### Learning Philosophy
1. **Build While Learning**: Every concept backed by real code
2. **Banking/Fintech Context**: All projects relevant to domain expertise
3. **AI-First Mindset**: Use AI tools to accelerate learning and coding
4. **Production Quality**: Industry best practices from day one
5. **Portfolio Driven**: Everything contributes to job-ready portfolio

---

## 📅 16-Week Program Structure

| Phase | Weeks | Focus Area | Deliverables |
|-------|-------|------------|--------------|
| **Phase 0** | Week 1 | Environment Setup & Foundations | Dev environment, accounts, first commits |
| **Phase 1** | Weeks 2-4 | Java/Spring Boot Mastery | Microservices, REST APIs, Banking API |
| **Phase 2** | Weeks 5-6 | Node.js & Python Backend | Multi-stack proficiency, async patterns |
| **Phase 3** | Weeks 7-8 | Frontend & Databases | React apps, multi-DB systems |
| **Phase 4** | Weeks 9-10 | AI Integration (Gemini, Claude) | AI-powered features, prompting mastery |
| **Phase 5** | Weeks 11-12 | MCP & Agentic AI | AI agents, tool integration, automation |
| **Phase 6** | Week 13 | Testing & Production Systems | Comprehensive testing, deployment |
| **Phase 7** | Weeks 14-16 | Portfolio & Interview Prep | 3 major projects, interview readiness |

---

# PHASE 0: Environment Setup & Foundations (Week 1)

## 🎯 Phase Overview
**Goal**: Set up professional development environment, create accounts, understand AI-assisted development, make first contributions to GitHub

**Time Allocation**: 40-50 hours
- Mac/Windows setup: 8 hours
- Account creation and configuration: 4 hours
- Git/GitHub fundamentals: 6 hours
- AI tools setup and training: 8 hours
- First project: 14 hours

---

## 📝 Section 0.1: Mac/Windows Development Environment Setup

### Brief
Professional software engineering requires a properly configured development environment. This section covers installing all necessary tools, configuring your system, and understanding the command line interface.

### Prerequisites
- Mac (macOS 12+) or Windows 11 PC
- Admin access to your computer
- Stable internet connection
- Minimum 16GB RAM, 50GB free disk space

---

### 🍎 Mac Setup (Recommended for Full Stack Development)

#### Step 1: Install Homebrew (Package Manager)

**What is Homebrew?**: A package manager for macOS that simplifies installing and managing software. Think of it as an "app store" for developer tools accessed via command line.

**Installation**:
1. Open **Terminal** (Cmd + Space, type "Terminal")
2. Run this command:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
3. Follow the on-screen instructions
4. After installation, add Homebrew to your PATH (the installer will show you the exact commands)

**Verify installation**:
```bash
brew --version
# Should show: Homebrew 4.x.x
```

**AI Prompting Example**:
```
Prompt to Gemini/Claude:
"I'm setting up a Mac for full-stack development. I've installed Homebrew.
What are the essential developer tools I should install next, and why is each important?"
```

#### Step 2: Install Core Development Tools

```bash
# Git version control
brew install git

# Node.js and npm (JavaScript runtime)
brew install node

# Java Development Kit (OpenJDK 21 - LTS version)
brew install openjdk@21

# Python 3.12
brew install python@3.12

# PostgreSQL database
brew install postgresql@16

# MongoDB database
brew tap mongodb/brew
brew install mongodb-community

# Redis cache
brew install redis

# Docker Desktop (containers)
# Download from: https://www.docker.com/products/docker-desktop

# Maven (Java build tool)
brew install maven

# Postman (API testing)
brew install --cask postman
```

**Verification Checklist**:
```bash
# Run each command and note the version
git --version          # Should be 2.40+
node --version         # Should be v20+
npm --version          # Should be 10+
java --version         # Should be openjdk 21
python3 --version      # Should be 3.12+
psql --version         # Should be 16+
mongod --version       # Should be 7.0+
redis-server --version # Should be 7.2+
mvn --version          # Should be 3.9+
docker --version       # Should be 24+
```

#### Step 3: Configure Java Environment

```bash
# Add Java to your shell profile
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
echo 'export JAVA_HOME="/opt/homebrew/opt/openjdk@21"' >> ~/.zshrc

# Reload shell configuration
source ~/.zshrc

# Verify Java
java -version
javac -version
echo $JAVA_HOME
```

#### Step 4: Install IDE and Code Editors

**Visual Studio Code (Primary Editor)**:
```bash
brew install --cask visual-studio-code
```

**Essential VS Code Extensions** (Install via VS Code Extensions marketplace):
1. **Language Support**:
   - Extension Pack for Java (Microsoft)
   - Spring Boot Extension Pack
   - Python (Microsoft)
   - JavaScript and TypeScript Nightly
   - ESLint

2. **AI Coding Assistants**:
   - Claude Code (when available)
   - GitHub Copilot
   - Codeium (free alternative)

3. **Development Tools**:
   - GitLens
   - Docker
   - Thunder Client (API testing in VS Code)
   - Prettier - Code formatter
   - Auto Rename Tag
   - Path Intellisense

4. **Database Tools**:
   - PostgreSQL (by Chris Kolkman)
   - MongoDB for VS Code

**IntelliJ IDEA Community Edition** (Optional, for heavy Java work):
```bash
brew install --cask intellij-idea-ce
```

---

### 🪟 Windows Setup

#### Step 1: Install Windows Subsystem for Linux (WSL2)

**What is WSL?**: Allows you to run a Linux environment directly on Windows without dual-booting. Most modern development tools work better in Linux environments.

**Installation**:
1. Open **PowerShell as Administrator**
2. Run:
```powershell
wsl --install
```
3. Restart your computer
4. After restart, set up Ubuntu with a username and password
5. Update WSL:
```powershell
wsl --update
```

**Set WSL2 as default**:
```powershell
wsl --set-default-version 2
```

#### Step 2: Install Windows Package Manager (winget)

Windows 11 comes with winget pre-installed. Verify:
```powershell
winget --version
```

#### Step 3: Install Core Development Tools (Windows)

**On Windows (PowerShell as Administrator)**:
```powershell
# Git
winget install Git.Git

# Node.js
winget install OpenJS.NodeJS.LTS

# Python
winget install Python.Python.3.12

# Visual Studio Code
winget install Microsoft.VisualStudioCode

# Docker Desktop
winget install Docker.DockerDesktop

# Postman
winget install Postman.Postman

# Windows Terminal (better terminal)
winget install Microsoft.WindowsTerminal
```

**On WSL/Ubuntu (for Linux-based development)**:
```bash
# Update package list
sudo apt update && sudo apt upgrade -y

# Essential tools
sudo apt install -y build-essential curl wget git

# Java
sudo apt install -y openjdk-21-jdk maven

# Node.js (using NodeSource)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Python
sudo apt install -y python3.12 python3-pip python3.12-venv

# PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Redis
sudo apt install -y redis-server

# MongoDB (follow official MongoDB Ubuntu guide)
# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/
```

#### Step 4: Configure Windows Terminal

1. Open **Windows Terminal**
2. Set WSL/Ubuntu as default profile:
   - Settings → Startup → Default profile → Ubuntu
3. Install a nice font (Cascadia Code, Fira Code)

**Verification Checklist** (Run in WSL terminal):
```bash
git --version
node --version
npm --version
java --version
python3 --version
psql --version
redis-server --version
mvn --version
docker --version
```

---

### 🔧 Common Configuration for Both Mac and Windows

#### Git Configuration

```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Set default branch name
git config --global init.defaultBranch main

# Set default editor
git config --global core.editor "code --wait"

# Enable color output
git config --global color.ui auto

# Set up credential helper
# Mac:
git config --global credential.helper osxkeychain

# Windows:
git config --global credential.helper manager-core

# View all settings
git config --list
```

#### SSH Key Setup for GitHub

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"
# Press Enter to accept default location
# Enter a secure passphrase (optional but recommended)

# Start SSH agent
# Mac/Linux:
eval "$(ssh-agent -s)"

# Windows (WSL):
eval $(ssh-agent -s)

# Add key to SSH agent
# Mac:
ssh-add ~/.ssh/id_ed25519

# Linux/Windows WSL:
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
# Mac:
pbcopy < ~/.ssh/id_ed25519.pub

# Linux/Windows WSL:
cat ~/.ssh/id_ed25519.pub
# Copy the output manually
```

**Add SSH Key to GitHub**:
1. Go to https://github.com/settings/keys
2. Click "New SSH key"
3. Title: "Mac/Windows Development Machine"
4. Paste the public key
5. Click "Add SSH key"

**Test connection**:
```bash
ssh -T git@github.com
# Should see: "Hi <username>! You've successfully authenticated..."
```

---

## 📝 Section 0.2: Account Creation and Service Setup

### Brief
Modern software development relies on cloud services, AI platforms, and collaboration tools. This section covers creating and configuring all necessary accounts.

### Accounts to Create

#### 1. Google Developer Program

**Why**: Access to Gemini AI, Google Cloud Platform, Firebase, and extensive learning resources.

**Steps**:
1. Go to: https://developers.google.com/
2. Sign in with your Google account (create one if needed)
3. Complete your developer profile
4. Enroll in Google Developer Program:
   - Navigate to: https://developers.google.com/profile
   - Complete enrollment
   - Explore learning paths

**Google Cloud Platform Setup**:
1. Go to: https://console.cloud.google.com/
2. Create a new project: "fullstack-ai-learning"
3. Enable billing (free tier includes $300 credit for 90 days)
4. Enable APIs:
   - Gemini API (Vertex AI)
   - Cloud Run
   - Cloud SQL
   - Cloud Storage

**Get Gemini API Key**:
1. Go to: https://makersuite.google.com/app/apikey
2. Create API key
3. Store securely (we'll use environment variables later)

**AI Prompt to Understand Gemini**:
```
Prompt to Gemini:
"I'm a developer new to Google's AI platform. Explain the difference between
Gemini 1.5 Pro, Gemini 1.5 Flash, and Gemini 2.0. When should I use each model?
What are the pricing implications?"
```

#### 2. Anthropic (Claude) API Setup

**Why**: Claude AI is exceptional for code generation, reasoning, and AI agent development.

**Steps**:
1. Go to: https://console.anthropic.com/
2. Sign up for an account
3. Add payment method (Pay-as-you-go pricing)
4. Generate API key:
   - Go to API Keys section
   - Create key named "fullstack-dev"
   - Store securely

**Claude Code CLI Setup**:

**Installation**:
```bash
# Mac:
brew install claude-code

# Windows (WSL):
# Follow instructions at: https://docs.anthropic.com/claude-code
```

**Configuration**:
```bash
# Initialize Claude Code
claude-code init

# This will prompt for API key
# Paste your Anthropic API key

# Test Claude Code
claude-code --version
```

#### 3. GitHub Account (Code Repository)

**Steps**:
1. Go to: https://github.com/signup
2. Choose username wisely (this is your professional identity)
3. Use professional email
4. Complete profile:
   - Add profile picture
   - Add bio: "Full Stack Engineer | AI | Banking/Fintech"
   - Add location
5. Enable two-factor authentication (Security settings)

**GitHub Organization Setup** (For portfolio projects):
```
1. Create new organization: "[YourName]-Portfolio"
2. Make it public
3. Add description: "Full Stack AI Engineering Projects"
```

**GitHub Best Practices**:
- Use meaningful commit messages
- Create README for every project
- Include license (MIT for learning projects)
- Pin top 6 projects to profile
- Contribute daily (green squares matter for job applications)

#### 4. Additional Service Accounts

**Docker Hub** (Container Registry):
- https://hub.docker.com/signup
- Free tier sufficient for learning

**Vercel** (Frontend Deployment):
- https://vercel.com/signup
- Sign up with GitHub (auto-sync repositories)
- Free tier includes unlimited deployments

**Railway** (Backend Deployment):
- https://railway.app/
- Sign up with GitHub
- Free tier: $5 credit/month

**MongoDB Atlas** (Cloud Database):
- https://www.mongodb.com/cloud/atlas/register
- Create free cluster (M0 Sandbox)
- Store connection string

**Supabase** (PostgreSQL as a Service):
- https://supabase.com/
- Create account
- Create first project: "learning-project"
- Note connection strings

---

## 📝 Section 0.3: Git and GitHub Fundamentals

### Brief
Version control is the foundation of modern software development. This section ensures you're proficient with Git workflows, branching strategies, and collaborative development practices.

### Learning Objectives
- Understand Git vs GitHub
- Master basic Git commands
- Learn industry-standard Git workflows
- Create meaningful commit messages
- Use branches effectively
- Understand pull requests and code review

### Git Fundamentals

#### Core Concepts

**What is Git?**
- Distributed version control system
- Tracks changes to code over time
- Enables collaboration
- Allows experimentation without breaking working code

**What is GitHub?**
- Cloud-based hosting for Git repositories
- Collaboration platform
- Portfolio showcase
- Industry standard for code sharing

#### Essential Git Commands

**Repository Initialization**:
```bash
# Create new repository
mkdir my-first-project
cd my-first-project
git init

# Check status
git status

# Create .gitignore file
cat > .gitignore << EOF
# Dependencies
node_modules/
venv/
target/

# Environment variables
.env
.env.local

# IDE
.vscode/
.idea/
*.iml

# OS
.DS_Store
Thumbs.db

# Build outputs
dist/
build/
*.log
EOF
```

**Basic Workflow**:
```bash
# Check status (do this often!)
git status

# Add files to staging area
git add filename.txt           # Add specific file
git add .                      # Add all changes
git add src/                   # Add directory

# Commit changes
git commit -m "Add user authentication feature"

# View commit history
git log
git log --oneline              # Compact view
git log --graph --oneline      # Visual branch history

# View changes
git diff                       # Unstaged changes
git diff --staged              # Staged changes
git diff HEAD~1                # Compare with previous commit
```

**Working with Remote Repositories**:
```bash
# Add remote repository
git remote add origin git@github.com:username/repo-name.git

# View remotes
git remote -v

# Push to remote
git push -u origin main        # First push (sets upstream)
git push                       # Subsequent pushes

# Pull from remote
git pull origin main

# Clone existing repository
git clone git@github.com:username/repo-name.git
cd repo-name
```

**Branching and Merging**:
```bash
# Create new branch
git branch feature/add-payment-api

# Switch to branch
git checkout feature/add-payment-api

# Create and switch in one command
git checkout -b feature/add-payment-api

# List branches
git branch                     # Local branches
git branch -a                  # All branches (including remote)

# Merge branch
git checkout main              # Switch to main
git merge feature/add-payment-api

# Delete branch
git branch -d feature/add-payment-api     # Safe delete
git branch -D feature/add-payment-api     # Force delete
```

**Undoing Changes**:
```bash
# Discard changes to a file (before staging)
git checkout -- filename.txt

# Unstage a file
git reset HEAD filename.txt

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes) - DANGEROUS!
git reset --hard HEAD~1

# Revert a commit (creates new commit)
git revert <commit-hash>

# Temporarily save changes
git stash                      # Stash changes
git stash list                 # View stashes
git stash apply                # Apply most recent stash
git stash pop                  # Apply and remove stash
```

### Industry-Standard Git Workflow

#### Commit Message Conventions

**Format**:
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style (formatting, semicolons, etc.)
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples**:
```bash
git commit -m "feat(auth): add JWT-based authentication"

git commit -m "fix(payment): resolve race condition in transaction processing"

git commit -m "docs(README): add setup instructions for Windows"

git commit -m "test(api): add integration tests for user endpoints"
```

**Multi-line commit**:
```bash
git commit -m "feat(fraud-detection): implement AI-based fraud detection

- Integrate Gemini API for transaction analysis
- Add real-time scoring mechanism
- Create alert system for suspicious activities
- Add comprehensive logging

Closes #42"
```

#### Branching Strategy (Git Flow Simplified)

**Branch Types**:

```
main (production-ready code)
  │
  ├── develop (integration branch)
  │     │
  │     ├── feature/add-user-auth
  │     ├── feature/payment-processing
  │     └── feature/fraud-detection
  │
  └── hotfix/critical-security-patch
```

**Workflow**:
```bash
# Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/add-user-authentication

# Work on feature, commit regularly
git add .
git commit -m "feat(auth): add login endpoint"
# ... more commits ...

# Finish feature
git checkout develop
git pull origin develop           # Get latest changes
git merge feature/add-user-authentication
git push origin develop

# Delete feature branch
git branch -d feature/add-user-authentication
```

### GitHub Workflow

#### Creating a Repository

**Via GitHub Website**:
1. Click "+" → "New repository"
2. Name: `payment-processing-api`
3. Description: "RESTful API for payment processing with fraud detection"
4. Public/Private: Start with Public (for portfolio)
5. Initialize with README: ✓
6. Add .gitignore: Choose language (Java, Node, Python)
7. License: MIT
8. Click "Create repository"

**Connect Local Repository**:
```bash
# Create local project
mkdir payment-processing-api
cd payment-processing-api

# Initialize Git
git init

# Create initial files
echo "# Payment Processing API" > README.md
echo "node_modules/" > .gitignore

# Initial commit
git add .
git commit -m "Initial commit: project setup"

# Connect to GitHub
git remote add origin git@github.com:username/payment-processing-api.git
git branch -M main
git push -u origin main
```

#### Pull Requests (PRs)

**Creating a Pull Request**:

```bash
# Create feature branch
git checkout -b feature/add-transaction-validation

# Make changes and commit
# ... (edit files) ...
git add .
git commit -m "feat(validation): add transaction validation rules"

# Push to GitHub
git push origin feature/add-transaction-validation
```

**On GitHub**:
1. Go to repository
2. Click "Compare & pull request" button
3. Title: `feat(validation): Add transaction validation rules`
4. Description:
   ```markdown
   ## Changes
   - Add input validation for transaction amounts
   - Implement currency code validation (ISO 4217)
   - Add merchant ID verification

   ## Testing
   - Unit tests added for all validation rules
   - Integration test with payment flow

   ## Screenshots
   (if applicable)

   Closes #15
   ```
5. Click "Create pull request"

**PR Best Practices**:
- Keep PRs small (< 400 lines of code)
- One feature per PR
- Write descriptive titles and descriptions
- Link related issues
- Add screenshots for UI changes
- Request reviews from team members
- Respond to feedback promptly

#### Code Review Process

**Reviewing a PR**:
1. Read the description
2. Check the changes tab
3. Look for:
   - Code quality
   - Test coverage
   - Security issues
   - Performance concerns
   - Best practices
4. Add comments (be constructive)
5. Approve or request changes

**Responding to Reviews**:
```bash
# Make requested changes
# ... (edit files) ...

git add .
git commit -m "fix: address code review feedback"
git push origin feature/add-transaction-validation

# PR automatically updates
```

### Hands-On Exercise

#### Exercise 0.3.1: Create Your First Repository

**Task**: Create a "learning-journal" repository to track your progress.

**Steps**:
1. Create repository on GitHub: `fullstack-ai-learning-journal`
2. Clone locally
3. Create proper structure
4. Make regular commits

**Structure**:
```
fullstack-ai-learning-journal/
├── README.md
├── .gitignore
├── Week-01/
│   ├── day-1.md
│   ├── day-2.md
│   └── exercises/
├── Week-02/
├── resources/
│   └── useful-links.md
└── projects/
    └── mini-projects.md
```

**Initial Files**:

**README.md**:
```markdown
# Full Stack AI Engineer Learning Journal

## Overview
This repository documents my 16-week journey from technology leadership
to hands-on full-stack AI engineering.

## Goals
- Master Java (Spring Boot), Node.js, and Python
- Build AI-powered applications using Gemini and Claude
- Create production-ready projects for portfolio
- Prepare for full-stack engineering roles in fintech

## Progress
- [Week 1: Environment Setup & Foundations](#week-1)
- [Week 2-4: Java/Spring Boot Mastery](#week-2-4)
- ... (add as you go)

## Projects
1. **Payment Processing API** - Spring Boot microservice
2. **Real-time Fraud Detection** - AI-powered system
3. **Banking Dashboard** - React + TypeScript frontend
... (add as you build)

## Technologies
### Backend
- Java 21, Spring Boot 3.x, Maven
- Node.js 20+, Express, NestJS
- Python 3.12, FastAPI, Django

### Frontend
- React 18, TypeScript, Next.js
- Tailwind CSS, shadcn/ui

### Databases
- PostgreSQL, MongoDB, Redis
- Vector DBs (Pinecone, Weaviate)

### AI/ML
- Google Gemini (1.5 Pro, 2.0)
- Claude (Sonnet 4.5, Opus 4.5)
- LangChain, LlamaIndex
- RAG systems, AI Agents

### DevOps
- Docker, Kubernetes
- GitHub Actions
- GCP, AWS, Railway

## Daily Routine
- 8:00 AM - 10:00 AM: Learning new concepts
- 10:00 AM - 1:00 PM: Hands-on coding
- 1:00 PM - 2:00 PM: Lunch + review
- 2:00 PM - 5:00 PM: Project work
- 5:00 PM - 6:00 PM: AI prompting practice & documentation

## Resources
- [Google Developer Resources](./resources/google-dev.md)
- [AI Prompting Cheat Sheet](./resources/prompting.md)
- [Useful GitHub Repos](./resources/github-repos.md)
```

**Commit and Push**:
```bash
cd fullstack-ai-learning-journal
git add .
git commit -m "Initial commit: create learning journal structure"
git push origin main
```

**Daily Practice** (Do this every day!):
```bash
# Create today's entry
cd fullstack-ai-learning-journal
mkdir -p Week-01
code Week-01/day-1.md

# Write your learnings (template below)
# Commit at end of day
git add .
git commit -m "docs(journal): add day 1 learnings"
git push origin main
```

**Daily Entry Template**:
```markdown
# Day 1 - January 18, 2026

## What I Learned
- Installed and configured development environment
- Set up Git and GitHub workflow
- Created first repository
- Learned Git branching strategies

## Code Written
- Learning journal repository setup
- First proper README file
- Git configuration files

## Challenges Faced
- Initial confusion with SSH key setup → Resolved by following GitHub docs
- Git merge conflicts in .gitignore → Learned conflict resolution

## AI Prompts Used
1. "Explain Git branching strategies for team development"
   - Result: Understood Git Flow and feature branching
2. "Best practices for .gitignore in multi-language projects"
   - Result: Created comprehensive .gitignore

## Tomorrow's Goals
- Complete Git fundamentals exercises
- Start learning Spring Boot basics
- Set up first Spring Boot project

## Time Spent
- Environment setup: 4 hours
- Git/GitHub practice: 3 hours
- Documentation: 1 hour
- **Total: 8 hours**

## Resources Used
- Git documentation: https://git-scm.com/doc
- GitHub Skills: https://skills.github.com/
- AI tool: Claude/Gemini for concept clarification
```

---

## 📝 Section 0.4: AI-Assisted Development Fundamentals

### Brief
AI-powered coding assistants (Gemini, Claude, Copilot) are transforming software development. This section teaches you how to effectively use AI to accelerate learning and coding while maintaining code quality and understanding.

### Learning Objectives
- Understand capabilities and limitations of AI coding assistants
- Master prompt engineering for code generation
- Learn when to use AI vs traditional learning
- Develop AI-human collaboration workflow
- Maintain code quality with AI assistance

---

### Understanding AI Coding Assistants

#### Comparison Table

| Feature | Gemini 2.0 | Claude Sonnet 4.5 | GitHub Copilot | Claude Code CLI |
|---------|------------|-------------------|----------------|-----------------|
| **Best For** | Multimodal, research | Reasoning, complex code | Inline completion | Terminal-based coding |
| **Context Window** | 2M tokens | 200K tokens | Limited | 200K tokens |
| **Code Generation** | Excellent | Exceptional | Good | Exceptional |
| **Explanation** | Very Good | Excellent | Limited | Excellent |
| **Debug Help** | Good | Excellent | Limited | Excellent |
| **Cost** | Moderate | Higher | $10/month | Pay-per-use |
| **Use Case** | Learning, research | Complex features | Fast autocomplete | Full projects |

#### When to Use Each Tool

**Google Gemini** (via AI Studio or API):
- Learning new concepts (tutorials, explanations)
- Analyzing documentation
- Multi-step problem solving
- Image/diagram understanding
- Long-form content generation

**Claude** (via Console or API):
- Complex code generation
- Refactoring large codebases
- Architecture decisions
- Detailed code reviews
- Writing tests

**Claude Code CLI**:
- Terminal-based development
- Quick prototypes
- Bug fixing in existing projects
- Learning by doing
- Automated refactoring

**GitHub Copilot**:
- Real-time code completion in IDE
- Boilerplate generation
- Quick function implementations
- Learning API usage patterns

---

### Prompt Engineering for Code

#### The CRAFT Framework

**C** - Context
**R** - Role
**A** - Action
**F** - Format
**T** - Target

#### Basic Prompting Pattern

**Poor Prompt** ❌:
```
"Write a function to validate email"
```

**Good Prompt** ✅:
```
Context: I'm building a Spring Boot REST API for a banking application.
Role: You are a senior Java developer with security expertise.
Action: Write a robust email validation function that:
- Validates format using RFC 5322 standard
- Checks for common typos (gamil.com, yhoo.com)
- Handles international domains
- Returns detailed error messages
Format: Java method with:
- JavaDoc comments
- JUnit 5 tests (minimum 10 test cases)
- Custom exception handling
Target: Production-ready code following Spring Boot best practices
```

#### Advanced Prompting Techniques

**1. Iterative Refinement**:
```
Prompt 1: "Create a simple REST API endpoint for user registration"
[Review output]

Prompt 2: "Add input validation using Spring Validation annotations"
[Review output]

Prompt 3: "Add password strength validation: min 12 chars, uppercase,
lowercase, number, special char"
[Review output]

Prompt 4: "Add rate limiting to prevent abuse (max 5 registrations per IP per hour)"
```

**2. Context-Rich Prompting**:
```
Context:
I have an existing Spring Boot application with:
- Spring Security configured
- PostgreSQL database with User entity
- JWT authentication
- Layered architecture (Controller → Service → Repository)

Current User entity:
```java
@Entity
public class User {
    @Id
    private UUID id;
    private String email;
    private String passwordHash;
    private LocalDateTime createdAt;
}
```

Action:
Add a "Two-Factor Authentication" feature that:
1. Generates TOTP codes (Google Authenticator compatible)
2. Adds enable/disable 2FA endpoint
3. Modifies login flow to check 2FA
4. Stores 2FA secret encrypted in database

Requirements:
- Use google-authenticator library
- Follow existing code patterns
- Add integration tests
- Document API endpoints

Format:
Provide:
1. Updated User entity
2. New TwoFactorAuthService
3. Modified AuthenticationController
4. Database migration script
5. API documentation
```

**3. Constraint-Based Prompting**:
```
Create a fraud detection service with these constraints:

Technology Stack:
- Must use Spring Boot 3.2+
- Must integrate with Gemini API
- Database: PostgreSQL with Liquibase migrations

Performance Requirements:
- Response time < 200ms
- Handle 1000 requests/second
- Async processing for AI calls

Security Requirements:
- Encrypt sensitive transaction data
- Audit log all decisions
- No PII in logs

Code Quality:
- 80%+ test coverage
- SonarQube quality gate: A
- Follow SOLID principles
- Document all public methods

Business Logic:
- Real-time transaction scoring (0-100)
- Alert when score > 75
- ML model integration
- Configurable rules engine
```

#### Prompt Templates for Learning

**1. Concept Explanation Template**:
```
I'm learning [TECHNOLOGY/CONCEPT].

My background: 15 years in Java, mainly banking applications, familiar with
Spring Framework 4.x, traditional MVC, SOAP web services.

Explain [SPECIFIC CONCEPT] in [TECHNOLOGY]:
- Compare it to similar concept in Java/Spring that I know
- Show practical example relevant to banking/fintech
- Explain why this approach is better/different
- Provide a mini-project idea to practice
- Common pitfalls to avoid

Example:
Explain "async/await in Node.js" comparing it to CompletableFuture in Java,
with a banking API example.
```

**2. Code Review Template**:
```
Review this code for:
- Security vulnerabilities (OWASP Top 10)
- Performance issues
- Best practices violations
- Potential bugs
- Code smells

Provide:
- Severity rating for each issue (Critical/High/Medium/Low)
- Explanation why it's an issue
- Corrected code
- Test to prevent regression

Code:
```[language]
[PASTE YOUR CODE]
```

**3. Debug Assistance Template**:
```
I'm getting an error in my [TECHNOLOGY] application:

Error Message:
```
[PASTE ERROR/STACK TRACE]
```

Context:
- What I'm trying to do: [DESCRIPTION]
- Environment: [OS, versions, dependencies]
- What I've tried: [STEPS TAKEN]

Code:
```[language]
[PASTE RELEVANT CODE]
```

Help me:
1. Understand what's causing the error
2. Provide step-by-step fix
3. Explain how to prevent this in the future
4. Suggest debugging techniques for similar issues
```

**4. Test Generation Template**:
```
Generate comprehensive tests for this code:

Code:
```[language]
[PASTE CODE TO TEST]
```

Requirements:
- Testing framework: [JUnit 5 / Jest / Pytest]
- Types: Unit tests, Integration tests, Edge cases
- Coverage: Aim for 90%+
- Include:
  * Happy path scenarios
  * Error handling
  * Boundary conditions
  * Edge cases
  * Performance tests (if applicable)

Format:
- Clear test names (should_doSomething_when_condition)
- Arrange-Act-Assert pattern
- Mock external dependencies
- Include setup/teardown
```

---

### AI-Assisted Learning Workflow

#### Phase 1: Understanding (Use Gemini/Claude)

```
Prompt Example:
"I need to learn Spring Boot 3.x WebFlux for building reactive APIs.

My background: Traditional Spring MVC with blocking I/O.

Provide:
1. Core concepts explanation (reactive streams, backpressure, etc.)
2. Key differences from Spring MVC (table format)
3. When to use reactive vs traditional (decision tree)
4. Learning roadmap with milestones
5. Three progressive coding exercises (easy→medium→hard)
6. Common mistakes developers make when switching

Make explanations practical with banking/payment processing examples."
```

#### Phase 2: Building (Use Claude Code / Copilot)

```
# Start a project with Claude Code CLI
claude-code

Prompt in Claude Code:
"Create a Spring Boot 3.2 WebFlux project for a payment processing API.

Structure:
- Multi-module Maven project
- Modules: api, service, domain, infrastructure
- Use R2DBC for reactive PostgreSQL access
- Include Docker Compose for local development

First endpoint: POST /api/v1/payments
Request:
{
  "amount": "100.00",
  "currency": "USD",
  "merchantId": "string",
  "customerId": "string"
}

Response:
{
  "transactionId": "uuid",
  "status": "PENDING|APPROVED|REJECTED",
  "timestamp": "ISO-8601"
}

Include:
- Request validation
- Idempotency handling (idempotency key)
- Rate limiting
- Comprehensive logging
- Unit and integration tests
- OpenAPI documentation"
```

#### Phase 3: Debugging (Iterative)

```
When you hit an error:

1. Try to understand it yourself (5-10 minutes)
2. If stuck, use AI:

"I'm getting this error in my Spring WebFlux application:

[ERROR] reactor.core.Exceptions$ErrorCallbackNotImplemented:
java.lang.IllegalStateException: block()/blockFirst()/blockLast()
are blocking, which is not supported in thread reactor-http-nio-3

Stack trace:
[PASTE FULL STACK TRACE]

Code where error occurs:
```java
@Service
public class PaymentService {
    public Payment processPayment(PaymentRequest request) {
        // This line causes the error
        Payment savedPayment = paymentRepository.save(payment).block();
        return savedPayment;
    }
}
```

I understand blocking is bad in reactive code, but how do I make this work?
Provide the correct reactive approach and explain why."
```

#### Phase 4: Optimization (AI + Manual Review)

```
After building a feature:

"Review this payment processing service for optimization:

```java
[PASTE YOUR CODE - could be 200-300 lines]
```

Current performance: 50 requests/second
Target: 500 requests/second

Analyze:
1. Performance bottlenecks
2. Memory usage issues
3. Database query optimization opportunities
4. Caching strategies
5. Reactive best practices violations

Provide:
- Prioritized list of improvements (biggest impact first)
- Refactored code for top 3 improvements
- Load testing script to validate improvements
- Monitoring metrics to track"
```

---

### Hands-On Exercise: AI-Assisted Development

#### Exercise 0.4.1: Build a "Daily Standup Bot" with AI Assistance

**Goal**: Create a simple Node.js CLI tool that asks standup questions and logs responses, using AI to help at each step.

**Requirements**:
- Ask 3 questions: "What did you do?", "What will you do?", "Any blockers?"
- Save responses to markdown file with timestamp
- Built using Node.js
- Use AI for learning and code generation

**Step-by-Step with AI Prompts**:

**Step 1: Project Setup**
```
Prompt to Claude:
"I'm brand new to Node.js but experienced in Java.

Help me set up a Node.js CLI project:
1. Explain what package.json is (compare to pom.xml)
2. Provide commands to initialize project
3. Explain what npm is (compare to Maven)
4. Show project structure for a simple CLI tool
5. What dependencies do I need for:
   - Reading user input from terminal
   - Writing to files
   - Date/time handling"
```

**Expected AI Response** (you'll implement this):
```bash
# Initialize project
mkdir standup-bot
cd standup-bot
npm init -y

# Install dependencies
npm install inquirer date-fns

# Create structure
mkdir src
touch src/index.js
touch src/standup.js
```

**Step 2: Understanding Dependencies**
```
Prompt to Gemini:
"Explain these Node.js packages with code examples:

1. inquirer - for CLI prompts
2. date-fns - for date formatting

Show me:
- Basic usage of each
- Comparison to Java equivalents (Scanner, java.time)
- Simple code example for each

Keep examples beginner-friendly."
```

**Step 3: Implementing Core Logic**
```
Prompt to Claude Code:
"Create a standup.js module that:

1. Uses inquirer to ask 3 questions:
   - 'What did you accomplish today?'
   - 'What will you work on tomorrow?'
   - 'Any blockers or concerns?'

2. Formats responses as markdown:
   # Daily Standup - [Date]

   ## Yesterday
   [answer 1]

   ## Today
   [answer 2]

   ## Blockers
   [answer 3]

3. Saves to file: standups/standup-YYYY-MM-DD.md

4. Exports function: runStandup()

Include error handling and create directory if it doesn't exist."
```

**Step 4: Testing**
```
Prompt to Claude:
"Generate Jest tests for the standup bot:

Test scenarios:
1. Creates standup directory if missing
2. Generates correct markdown format
3. Handles empty responses
4. Creates file with correct date format
5. Doesn't overwrite existing standup for same day

Provide:
- Jest configuration
- Test file with all scenarios
- Mocking file system operations
- How to run tests"
```

**Step 5: Documentation**
```
Prompt to Gemini:
"Create a professional README.md for this standup bot project including:
- Project description
- Features
- Installation instructions
- Usage examples
- Project structure explanation
- Technologies used
- Future enhancements
- License

Make it suitable for a portfolio project."
```

**Step 6: Enhancement (Your Practice)**
```
Prompt to Claude:
"Enhance the standup bot with:
1. Ability to view past standups
2. Weekly summary generation
3. Export to PDF
4. Configuration file for custom questions

Provide implementation plan and code for #1 and #2.
I'll implement #3 and #4 myself to practice."
```

---

### Section 0.4 Checklist

#### Environment Setup Verification
```bash
# Run this verification script
# Save as: verify-setup.sh

#!/bin/bash

echo "=== Development Environment Verification ==="
echo ""

# Git
echo "✓ Git Version:"
git --version || echo "❌ Git not installed"

# Node.js
echo "✓ Node.js Version:"
node --version || echo "❌ Node.js not installed"

# Java
echo "✓ Java Version:"
java --version || echo "❌ Java not installed"

# Python
echo "✓ Python Version:"
python3 --version || echo "❌ Python not installed"

# PostgreSQL
echo "✓ PostgreSQL Version:"
psql --version || echo "❌ PostgreSQL not installed"

# MongoDB
echo "✓ MongoDB Version:"
mongod --version || echo "❌ MongoDB not installed"

# Redis
echo "✓ Redis Version:"
redis-server --version || echo "❌ Redis not installed"

# Docker
echo "✓ Docker Version:"
docker --version || echo "❌ Docker not installed"

# Maven
echo "✓ Maven Version:"
mvn --version || echo "❌ Maven not installed"

# SSH Key
echo "✓ SSH Key exists:"
ls -la ~/.ssh/id_ed25519.pub && echo "✓ SSH Key found" || echo "❌ No SSH key"

# Git Config
echo "✓ Git Configuration:"
git config --global user.name && git config --global user.email || echo "❌ Git not configured"

echo ""
echo "=== Verification Complete ==="
```

#### AI Tools Setup Checklist
- [ ] Google Account created
- [ ] Enrolled in Google Developer Program
- [ ] Google Cloud Project created
- [ ] Gemini API key obtained and tested
- [ ] Anthropic account created
- [ ] Claude API key obtained
- [ ] Claude Code CLI installed and configured
- [ ] GitHub Copilot installed (optional)
- [ ] First AI-assisted code generated successfully

#### Git/GitHub Mastery Checklist
- [ ] GitHub account created with professional profile
- [ ] SSH key generated and added to GitHub
- [ ] SSH connection to GitHub tested successfully
- [ ] Created "fullstack-ai-learning-journal" repository
- [ ] Made 10+ commits with proper commit messages
- [ ] Created at least 2 branches
- [ ] Performed a merge operation
- [ ] Created first Pull Request
- [ ] Understand .gitignore and have proper file
- [ ] Can explain: commit, branch, merge, pull, push, clone
- [ ] Can resolve a basic merge conflict

#### AI-Assisted Development Checklist
- [ ] Completed "standup bot" exercise
- [ ] Used AI to learn a new concept (Node.js modules)
- [ ] Used AI to generate code
- [ ] Used AI to generate tests
- [ ] Used AI to debug an error
- [ ] Used AI to optimize code
- [ ] Can write effective prompts using CRAFT framework
- [ ] Understand when to use AI vs traditional learning
- [ ] Created personal prompt templates collection

---

### Section 0.4 Success Metrics

#### Knowledge Assessment

**Self-Assessment Quiz** (Answer without AI help):

1. **Git Fundamentals**:
   - Explain the difference between `git pull` and `git fetch`
   - When would you use `git rebase` vs `git merge`?
   - What does `git stash` do and when is it useful?

2. **Development Environment**:
   - Explain the role of package managers (brew, apt, npm, pip, maven)
   - What is the purpose of environment variables?
   - Why use SSH keys instead of passwords for GitHub?

3. **AI-Assisted Development**:
   - What are the risks of blindly copying AI-generated code?
   - How do you verify AI-generated code is correct?
   - When should you NOT use AI for learning?

**Practical Assessment**:

Task: Create a new GitHub repository for a "weather CLI" app using only terminal commands:
- Initialize repo locally
- Create proper README
- Add .gitignore for Node.js
- Make 5 meaningful commits
- Create GitHub repo via command line (using `gh` CLI)
- Push to GitHub
- Create a branch, make changes, create PR

**Time Limit**: 20 minutes
**Success**: All steps completed without errors

---

### Week 1 Mini-Project: Developer Portfolio Setup

#### Project Brief
Create your developer portfolio website using AI assistance. This will be your landing page for job applications.

#### Requirements
- Personal portfolio website
- "About Me" section (your transition story)
- "Skills" section (what you're learning)
- "Projects" section (will grow over 16 weeks)
- "Blog" section (for learning journal entries)
- Contact form
- Deployed and live

#### Technology Stack
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui components
- Deployed on Vercel

#### AI-Assisted Build Process

**Phase 1: Planning** (30 minutes)
```
Prompt to Claude:
"I need to create a developer portfolio website.

About me:
- Transitioning from tech leadership to full-stack engineering
- 15 years in banking technology
- Learning: Java, Node.js, Python, AI development
- Goal: Showcase projects as I build them over next 3 months

Help me:
1. Design site structure (pages, sections)
2. Choose color scheme (professional, tech-focused)
3. List must-have sections
4. Suggest 3 portfolio website designs (describe or link examples)
5. Recommend tech stack (I'm thinking Next.js + Tailwind)

Provide a site map and design brief."
```

**Phase 2: Setup** (1 hour)
```
Prompt to Claude Code:
"Create a Next.js 14 portfolio website:

Setup:
- Initialize Next.js with App Router
- Configure TypeScript (strict mode)
- Set up Tailwind CSS
- Install shadcn/ui
- Configure ESLint and Prettier

Structure:
pages:
- / (home)
- /about
- /projects
- /blog
- /contact

Include:
- Responsive layout
- Dark/light mode toggle
- SEO-friendly setup (metadata)
- Basic navigation

Generate project with all configuration files."
```

**Phase 3: Build Pages** (3-4 hours)

Use AI to generate each page, but customize content manually:

```
Prompt for Home Page:
"Create a hero section for portfolio homepage:

Content to highlight:
- Name: [Your Name]
- Title: 'Full Stack Engineer | AI Enthusiast | Banking Technology'
- Tagline: 'Transforming 15 years of technology leadership into
  hands-on engineering excellence'
- CTA buttons: 'View Projects' and 'Read My Journey'

Design:
- Modern, clean aesthetic
- Animated gradient background
- Typewriter effect for tagline
- Social links (GitHub, LinkedIn)

Use: Next.js, TypeScript, Tailwind CSS, Framer Motion for animations

Provide complete component code."
```

**Phase 4: Deploy** (30 minutes)
```
Steps:
1. Push to GitHub
2. Connect Vercel to repository
3. Configure environment variables (if needed)
4. Deploy
5. Get live URL

# Document deployment in README
```

#### Success Criteria
- [ ] Website loads successfully at custom domain/Vercel URL
- [ ] Responsive on mobile, tablet, desktop
- [ ] All links work
- [ ] Dark/light mode functional
- [ ] Lighthouse score: 90+ (Performance, Accessibility, Best Practices, SEO)
- [ ] Repository has clean commit history
- [ ] README documents how to run locally

#### Time Estimate
- Planning: 1 hour
- Setup and configuration: 1 hour
- Page development: 4-5 hours
- Content writing: 2 hours
- Deployment and testing: 1 hour
- **Total: 9-10 hours**

---

## Week 1 Success Metrics Summary

### Technical Skills Checklist
- [ ] Development environment fully configured (Mac or Windows)
- [ ] Can use terminal/command line confidently
- [ ] All development tools installed and verified
- [ ] Git commands mastered (at least 15 commands)
- [ ] Made 20+ Git commits with proper messages
- [ ] Created 3+ GitHub repositories
- [ ] Completed at least 1 Pull Request
- [ ] AI tools (Gemini, Claude) set up and tested
- [ ] Built and deployed portfolio website
- [ ] Learning journal started with daily entries

### Time Tracking
**Week 1 Breakdown** (target: 40-50 hours):
- Environment setup: 8-10 hours
- Git/GitHub mastery: 8-10 hours
- AI tools and prompting practice: 8-10 hours
- Portfolio project: 10-12 hours
- Documentation and journal: 4-6 hours

### Portfolio Output
By end of Week 1, you should have:
1. **GitHub Profile**:
   - Professional profile picture and bio
   - 3-4 repositories
   - Green contribution graph (daily commits)

2. **Live Portfolio Website**:
   - Professional landing page
   - About section with your story
   - Skills section (growing list)
   - Projects section (1 project: the portfolio itself)
   - Blog with first learning journal entry

3. **Learning Journal**:
   - Daily entries for 5-7 days
   - Documenting setup challenges and solutions
   - AI prompts used and results
   - Personal reflections

### Knowledge Validation

**You should be able to explain**:
1. What is a package manager and name 4 examples
2. Difference between Git and GitHub
3. Git branching strategy (at least Git Flow basics)
4. How to write effective commit messages
5. What is SSH and why use it for GitHub
6. 3 best practices for using AI coding assistants
7. When to use Gemini vs Claude vs Copilot
8. How to structure an effective AI prompt
9. The software development lifecycle (briefly)
10. What makes a good portfolio project

**Hands-on validation**:
- Create a new repository from scratch in under 5 minutes
- Write a prompt that generates a working function with tests
- Debug a simple error using AI assistance
- Deploy a simple app to Vercel

---

## Week 1 Resources

### Official Documentation
- **Git**: https://git-scm.com/doc
- **GitHub**: https://docs.github.com/
- **Node.js**: https://nodejs.org/docs/
- **Next.js**: https://nextjs.org/docs
- **Google Gemini**: https://ai.google.dev/docs
- **Anthropic Claude**: https://docs.anthropic.com/

### Interactive Learning
- **GitHub Skills**: https://skills.github.com/
  - Introduction to GitHub
  - Communicate using Markdown
  - GitHub Pages

- **Google Codelabs**: https://codelabs.developers.google.com/
  - Filter by: Web, Cloud, AI/ML

### YouTube Channels (for visual learning)
- **Fireship**: Quick, concise tech explanations
- **Web Dev Simplified**: Great for frontend fundamentals
- **TechWorld with Nana**: DevOps and deployment
- **freeCodeCamp**: Long-form comprehensive courses

### Command Cheat Sheets
- **Git**: https://education.github.com/git-cheat-sheet-education.pdf
- **Terminal**: https://github.com/0nn0/terminal-mac-cheatsheet
- **VS Code**: https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf

### AI Resources
- **Prompt Engineering Guide**: https://www.promptingguide.ai/
- **Google AI Studio**: https://makersuite.google.com/
- **Claude Console**: https://console.anthropic.com/

---

## Next Week Preview: Java/Spring Boot Mastery

In Week 2-4, you'll dive deep into modern Java development:
- Spring Boot 3.2+ with Java 21
- Building RESTful APIs
- Spring Data JPA
- Spring Security
- Microservices architecture
- First major project: **Payment Processing API**

**Prep Work for Week 2** (Optional, but recommended):
1. Read: "Spring Boot in Action" (Chapters 1-3)
2. Watch: Spring Boot tutorial on YouTube (2-hour overview)
3. Review: Java 21 new features (records, pattern matching, virtual threads)
4. Set up: IntelliJ IDEA Community Edition

---

# PHASE 1: Java/Spring Boot Mastery (Weeks 2-4)

## 🎯 Phase Overview

**Goal**: Master modern Java development with Spring Boot 3.x, build production-ready microservices, and create your first major portfolio project.

**Time Allocation**: 120-140 hours over 3 weeks
- Spring Boot fundamentals: 30 hours
- REST API development: 25 hours
- Data persistence (JPA, PostgreSQL): 20 hours
- Spring Security & JWT: 20 hours
- Testing & best practices: 15 hours
- Major project (Payment API): 40 hours
- Documentation & refinement: 10 hours

**Key Learning Outcomes**:
- Build enterprise-grade REST APIs
- Implement authentication & authorization
- Work with relational databases (JPA, PostgreSQL)
- Write comprehensive tests (unit, integration, e2e)
- Deploy microservices with Docker
- Follow SOLID principles and design patterns

---

## 📝 Section 1.1: Spring Boot 3.x Fundamentals

### Brief
Spring Boot has revolutionized Java development by providing production-ready configurations out of the box. Spring Boot 3.x leverages Java 17+ features and introduces native compilation, observability improvements, and enhanced developer experience.

### Learning Objectives
- Understand Spring Boot architecture and auto-configuration
- Master dependency injection and IoC container
- Learn Spring Boot project structure and conventions
- Understand Spring Boot vs traditional Spring
- Use Spring Initializr and Maven/Gradle

---

### Setting Up Your First Spring Boot Project

#### Understanding Spring Boot

**What is Spring Boot?**
Spring Boot is an opinionated framework built on top of the Spring Framework that:
- Eliminates boilerplate configuration (XML configs, etc.)
- Provides embedded servers (Tomcat, Jetty, Netty)
- Offers production-ready features (health checks, metrics, monitoring)
- Enables rapid application development
- Follows convention over configuration

**Spring Boot 3.x Key Features**:
- Built on Spring Framework 6.0+
- Requires Java 17 minimum (we use Java 21)
- Native compilation support with GraalVM
- Improved observability (Micrometer, tracing)
- Jakarta EE 9+ (namespace change: javax.* → jakarta.*)
- HTTP interfaces for declarative clients
- Problem Details (RFC 7807) for error responses

#### AI Prompt to Understand Spring Boot

```
Prompt to Claude:
"I'm a Java developer with 15 years of experience, but my last Spring
experience was Spring Framework 4.x with XML configuration and traditional
WAR deployments to Tomcat.

Explain Spring Boot 3.x:
1. What fundamentally changed from Spring 4.x to Spring Boot 3.x?
2. What is 'auto-configuration' and how does it work?
3. Why embedded servers instead of WAR deployments?
4. What is Spring's 'IoC Container' and Dependency Injection (with modern examples)?
5. Show a comparison: Traditional Spring vs Spring Boot (code example)

Keep explanations practical with banking API examples."
```

---

### Creating Your First Project

#### Method 1: Spring Initializr (Web)

1. Go to: https://start.spring.io/

**Configuration**:
```
Project: Maven
Language: Java
Spring Boot: 3.2.1 (or latest stable)
Project Metadata:
  Group: com.yourname.banking
  Artifact: account-service
  Name: Account Service
  Description: Banking Account Management Service
  Package name: com.yourname.banking.account
  Packaging: Jar
  Java: 21

Dependencies (click "Add Dependencies"):
- Spring Web
- Spring Data JPA
- PostgreSQL Driver
- Lombok
- Spring Boot DevTools
- Validation
- Spring Boot Actuator
```

2. Click "Generate" → Downloads ZIP file
3. Extract and open in IDE

#### Method 2: Spring Initializr CLI (Recommended)

```bash
# Install Spring Boot CLI
# Mac:
brew install spring-boot

# Verify
spring --version

# Create project
spring init \
  --dependencies=web,data-jpa,postgresql,lombok,devtools,validation,actuator \
  --group=com.yourname.banking \
  --artifact=account-service \
  --name=AccountService \
  --description="Banking Account Management Service" \
  --package-name=com.yourname.banking.account \
  --java-version=21 \
  --type=maven-project \
  account-service

# Navigate to project
cd account-service

# Open in VS Code
code .

# Or IntelliJ
idea .
```

#### Method 3: AI-Assisted Project Generation

```
Prompt to Claude Code:
"Create a Spring Boot 3.2 Maven project for a banking account management service.

Requirements:
- Group ID: com.yourname.banking
- Artifact ID: account-service
- Java 21
- Dependencies: Spring Web, Spring Data JPA, PostgreSQL, Lombok, Validation, Actuator
- Multi-module structure:
  * account-api (REST controllers)
  * account-service (business logic)
  * account-domain (entities, repositories)
  * account-infrastructure (config, security)

Generate:
1. Complete pom.xml with all dependencies
2. Application.java (main class)
3. application.yml (configuration file)
4. Proper package structure
5. .gitignore for Java/Maven
6. README.md with setup instructions
7. Docker Compose for PostgreSQL

Follow Spring Boot best practices and clean architecture principles."
```

---

### Project Structure Deep Dive

```
account-service/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/yourname/banking/account/
│   │   │       ├── AccountServiceApplication.java    # Main entry point
│   │   │       ├── controller/                        # REST endpoints
│   │   │       │   └── AccountController.java
│   │   │       ├── service/                           # Business logic
│   │   │       │   ├── AccountService.java           # Interface
│   │   │       │   └── AccountServiceImpl.java       # Implementation
│   │   │       ├── repository/                        # Data access
│   │   │       │   └── AccountRepository.java
│   │   │       ├── model/                             # Domain entities
│   │   │       │   ├── entity/
│   │   │       │   │   └── Account.java
│   │   │       │   └── dto/
│   │   │       │       ├── AccountRequest.java
│   │   │       │       └── AccountResponse.java
│   │   │       ├── exception/                         # Custom exceptions
│   │   │       │   ├── AccountNotFoundException.java
│   │   │       │   └── GlobalExceptionHandler.java
│   │   │       └── config/                            # Configuration classes
│   │   │           └── DatabaseConfig.java
│   │   └── resources/
│   │       ├── application.yml                        # Main configuration
│   │       ├── application-dev.yml                    # Dev profile
│   │       ├── application-prod.yml                   # Prod profile
│   │       └── db/
│   │           └── migration/                         # Database migrations
│   │               └── V1__create_accounts_table.sql
│   └── test/
│       └── java/
│           └── com/yourname/banking/account/
│               ├── controller/                         # Controller tests
│               │   └── AccountControllerTest.java
│               ├── service/                            # Service tests
│               │   └── AccountServiceTest.java
│               ├── repository/                         # Repository tests
│               │   └── AccountRepositoryTest.java
│               └── integration/                        # Integration tests
│                   └── AccountIntegrationTest.java
├── pom.xml                                            # Maven configuration
├── Dockerfile                                         # Container image
├── docker-compose.yml                                 # Local development
├── .gitignore
└── README.md
```

**Explanation of Each Layer**:

1. **Controller Layer**:
   - Handles HTTP requests/responses
   - Input validation
   - Maps DTOs to/from domain entities
   - Returns appropriate HTTP status codes

2. **Service Layer**:
   - Contains business logic
   - Transaction management
   - Orchestrates multiple repository calls
   - Throws business exceptions

3. **Repository Layer**:
   - Database operations
   - Extends Spring Data JPA repositories
   - Custom query methods

4. **Model Layer**:
   - **Entities**: JPA entities (database tables)
   - **DTOs**: Data Transfer Objects (API contracts)
   - Separation of concerns (don't expose entities directly)

5. **Exception Layer**:
   - Custom business exceptions
   - Global exception handler
   - Standardized error responses

6. **Configuration Layer**:
   - Bean definitions
   - Security configuration
   - Database configuration
   - External integrations

---

### Core Spring Boot Concepts

#### 1. Dependency Injection (DI) and Inversion of Control (IoC)

**What is DI/IoC?**
Instead of creating objects yourself (`new MyService()`), Spring creates and manages them for you. You declare dependencies, Spring injects them.

**Traditional Approach** (❌ Don't do this):
```java
public class AccountController {
    private AccountService accountService;

    public AccountController() {
        // Tight coupling, hard to test, hard to change
        this.accountService = new AccountServiceImpl();
    }
}
```

**Spring Boot Approach** (✅ Do this):
```java
@RestController
@RequestMapping("/api/v1/accounts")
@RequiredArgsConstructor  // Lombok generates constructor
public class AccountController {

    private final AccountService accountService;  // Spring injects this

    // No constructor needed (Lombok creates it)
    // Spring automatically finds AccountService implementation and injects it
}
```

**How Spring IoC Works**:
1. Spring scans for components (`@Component`, `@Service`, `@Repository`, `@Controller`)
2. Creates instances (beans) of these classes
3. Manages lifecycle and dependencies
4. Injects dependencies where needed

**Bean Scopes**:
- **Singleton** (default): One instance per Spring container
- **Prototype**: New instance for each injection
- **Request**: One instance per HTTP request
- **Session**: One instance per HTTP session

#### 2. Auto-Configuration

**What is Auto-Configuration?**
Spring Boot automatically configures your application based on:
- Dependencies on classpath
- Properties you define
- Beans you create

**Example**:
When you add `spring-boot-starter-data-jpa` and `postgresql` driver:
- Spring Boot auto-configures:
  * DataSource
  * EntityManagerFactory
  * TransactionManager
  * JPA repositories

**You only need to provide**:
```yaml
# application.yml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/bankingdb
    username: bankuser
    password: bankpass
```

**To see all auto-configurations**:
```yaml
# application.yml
logging:
  level:
    org.springframework.boot.autoconfigure: DEBUG
```

#### 3. Application Configuration

**application.yml** (Preferred over .properties):
```yaml
# Application Identity
spring:
  application:
    name: account-service

  # Database Configuration
  datasource:
    url: jdbc:postgresql://localhost:5432/banking_accounts
    username: ${DB_USERNAME:bankuser}        # Environment variable with default
    password: ${DB_PASSWORD:bankpass}
    driver-class-name: org.postgresql.Driver
    hikari:                                   # Connection pool
      maximum-pool-size: 10
      minimum-idle: 5
      connection-timeout: 30000

  # JPA Configuration
  jpa:
    database-platform: org.hibernate.dialect.PostgreSQLDialect
    hibernate:
      ddl-auto: validate                     # Never use 'create' or 'update' in production!
    show-sql: false                          # Set true for debugging
    properties:
      hibernate:
        format_sql: true
        use_sql_comments: true

  # Flyway Database Migrations
  flyway:
    enabled: true
    baseline-on-migrate: true
    locations: classpath:db/migration

# Server Configuration
server:
  port: 8080
  servlet:
    context-path: /api
  error:
    include-message: always
    include-stacktrace: on_param              # Only show stack trace with ?trace=true

# Actuator Configuration (Health checks, metrics)
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  endpoint:
    health:
      show-details: when-authorized

# Application-Specific Configuration
banking:
  account:
    max-overdraft: 500.00
    daily-transaction-limit: 10000.00
    interest-rate: 0.05

# Logging
logging:
  level:
    root: INFO
    com.yourname.banking: DEBUG
    org.springframework.web: DEBUG
  pattern:
    console: "%d{yyyy-MM-dd HH:mm:ss} - %logger{36} - %msg%n"
  file:
    name: logs/account-service.log
```

**Profile-Specific Configuration**:

**application-dev.yml** (Development):
```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/banking_dev
  jpa:
    show-sql: true
    hibernate:
      ddl-auto: create-drop                  # Recreate database on restart

logging:
  level:
    com.yourname.banking: DEBUG
```

**application-prod.yml** (Production):
```yaml
spring:
  datasource:
    url: ${DATABASE_URL}                     # From environment
    hikari:
      maximum-pool-size: 20
  jpa:
    show-sql: false
    hibernate:
      ddl-auto: validate                     # Never change schema!

logging:
  level:
    root: WARN
    com.yourname.banking: INFO
```

**Activate Profile**:
```bash
# Development
java -jar account-service.jar --spring.profiles.active=dev

# Production
java -jar account-service.jar --spring.profiles.active=prod

# Or set environment variable
export SPRING_PROFILES_ACTIVE=dev
```

---

### Your First Spring Boot Application

#### AccountServiceApplication.java (Main Class)

```java
package com.yourname.banking.account;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main entry point for the Account Service application.
 *
 * @SpringBootApplication is a convenience annotation that combines:
 * - @Configuration: Marks class as source of bean definitions
 * - @EnableAutoConfiguration: Enables Spring Boot's auto-configuration
 * - @ComponentScan: Scans for components in current package and sub-packages
 */
@SpringBootApplication
public class AccountServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AccountServiceApplication.class, args);
    }
}
```

#### Account Entity (Domain Model)

```java
package com.yourname.banking.account.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Represents a bank account in the system.
 *
 * JPA Annotations:
 * @Entity: Marks this as a JPA entity (database table)
 * @Table: Specifies table name and indexes
 * @Id: Primary key field
 * @GeneratedValue: How primary key is generated
 *
 * Lombok Annotations:
 * @Data: Generates getters, setters, toString, equals, hashCode
 * @Builder: Enables builder pattern
 * @NoArgsConstructor: Generates no-arg constructor (required by JPA)
 * @AllArgsConstructor: Generates all-args constructor
 */
@Entity
@Table(name = "accounts", indexes = {
    @Index(name = "idx_account_number", columnList = "account_number", unique = true),
    @Index(name = "idx_customer_id", columnList = "customer_id")
})
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "account_number", nullable = false, unique = true, length = 20)
    private String accountNumber;

    @Column(name = "customer_id", nullable = false)
    private UUID customerId;

    @Enumerated(EnumType.STRING)
    @Column(name = "account_type", nullable = false)
    private AccountType accountType;

    @Column(name = "balance", nullable = false, precision = 19, scale = 2)
    private BigDecimal balance;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private AccountStatus status;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) {
            status = AccountStatus.ACTIVE;
        }
        if (balance == null) {
            balance = BigDecimal.ZERO;
        }
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    // Enums
    public enum AccountType {
        SAVINGS, CHECKING, MONEY_MARKET, CERTIFICATE_OF_DEPOSIT
    }

    public enum AccountStatus {
        ACTIVE, SUSPENDED, CLOSED
    }
}
```

#### Account Repository

```java
package com.yourname.banking.account.repository;

import com.yourname.banking.account.model.entity.Account;
import com.yourname.banking.account.model.entity.Account.AccountStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Repository interface for Account entity.
 *
 * Spring Data JPA provides implementation automatically.
 * Methods are generated based on naming convention.
 */
@Repository
public interface AccountRepository extends JpaRepository<Account, UUID> {

    // Find by account number
    Optional<Account> findByAccountNumber(String accountNumber);

    // Find all accounts for a customer
    List<Account> findByCustomerId(UUID customerId);

    // Find active accounts for a customer
    List<Account> findByCustomerIdAndStatus(UUID customerId, AccountStatus status);

    // Check if account exists
    boolean existsByAccountNumber(String accountNumber);

    // Find accounts with balance greater than amount
    List<Account> findByBalanceGreaterThan(BigDecimal amount);

    // Custom JPQL query
    @Query("SELECT a FROM Account a WHERE a.customerId = :customerId AND a.balance > :minBalance")
    List<Account> findCustomerAccountsAboveBalance(
        @Param("customerId") UUID customerId,
        @Param("minBalance") BigDecimal minBalance
    );

    // Native SQL query
    @Query(value = "SELECT * FROM accounts WHERE customer_id = :customerId ORDER BY balance DESC LIMIT 1",
           nativeQuery = true)
    Optional<Account> findCustomerHighestBalanceAccount(@Param("customerId") UUID customerId);
}
```

**Spring Data JPA Query Method Naming**:
```
findBy + FieldName + Condition

Examples:
- findByCustomerId(UUID id) → WHERE customer_id = ?
- findByCustomerIdAndStatus(UUID id, Status status) → WHERE customer_id = ? AND status = ?
- findByBalanceGreaterThan(BigDecimal amount) → WHERE balance > ?
- findByCreatedAtBetween(LocalDateTime start, LocalDateTime end) → WHERE created_at BETWEEN ? AND ?
- findByAccountNumberContaining(String partial) → WHERE account_number LIKE %?%
```

#### Account Service (Business Logic)

```java
package com.yourname.banking.account.service;

import com.yourname.banking.account.model.dto.AccountRequest;
import com.yourname.banking.account.model.dto.AccountResponse;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

/**
 * Service interface for account operations.
 * Define interface for testability and loose coupling.
 */
public interface AccountService {

    AccountResponse createAccount(AccountRequest request);

    AccountResponse getAccount(UUID accountId);

    AccountResponse getAccountByAccountNumber(String accountNumber);

    List<AccountResponse> getCustomerAccounts(UUID customerId);

    AccountResponse deposit(UUID accountId, BigDecimal amount);

    AccountResponse withdraw(UUID accountId, BigDecimal amount);

    AccountResponse closeAccount(UUID accountId);

    void deleteAccount(UUID accountId);
}
```

```java
package com.yourname.banking.account.service;

import com.yourname.banking.account.exception.AccountNotFoundException;
import com.yourname.banking.account.exception.InsufficientFundsException;
import com.yourname.banking.account.exception.InvalidOperationException;
import com.yourname.banking.account.model.dto.AccountRequest;
import com.yourname.banking.account.model.dto.AccountResponse;
import com.yourname.banking.account.model.entity.Account;
import com.yourname.banking.account.repository.AccountRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Implementation of AccountService.
 *
 * @Service: Marks this as a Spring service component
 * @Transactional: All methods run in database transactions
 * @Slf4j: Lombok annotation for logging
 * @RequiredArgsConstructor: Lombok generates constructor for final fields
 */
@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {

    private final AccountRepository accountRepository;

    @Override
    public AccountResponse createAccount(AccountRequest request) {
        log.info("Creating account for customer: {}", request.getCustomerId());

        // Generate unique account number
        String accountNumber = generateAccountNumber();

        // Build entity
        Account account = Account.builder()
            .accountNumber(accountNumber)
            .customerId(request.getCustomerId())
            .accountType(request.getAccountType())
            .balance(request.getInitialDeposit() != null ? request.getInitialDeposit() : BigDecimal.ZERO)
            .status(Account.AccountStatus.ACTIVE)
            .build();

        // Save to database
        Account savedAccount = accountRepository.save(account);

        log.info("Account created successfully: {}", savedAccount.getAccountNumber());

        return mapToResponse(savedAccount);
    }

    @Override
    @Transactional(readOnly = true)  // Optimization for read-only operations
    public AccountResponse getAccount(UUID accountId) {
        log.debug("Fetching account: {}", accountId);

        Account account = accountRepository.findById(accountId)
            .orElseThrow(() -> new AccountNotFoundException("Account not found: " + accountId));

        return mapToResponse(account);
    }

    @Override
    @Transactional(readOnly = true)
    public AccountResponse getAccountByAccountNumber(String accountNumber) {
        log.debug("Fetching account by number: {}", accountNumber);

        Account account = accountRepository.findByAccountNumber(accountNumber)
            .orElseThrow(() -> new AccountNotFoundException("Account not found: " + accountNumber));

        return mapToResponse(account);
    }

    @Override
    @Transactional(readOnly = true)
    public List<AccountResponse> getCustomerAccounts(UUID customerId) {
        log.debug("Fetching accounts for customer: {}", customerId);

        return accountRepository.findByCustomerIdAndStatus(customerId, Account.AccountStatus.ACTIVE)
            .stream()
            .map(this::mapToResponse)
            .collect(Collectors.toList());
    }

    @Override
    public AccountResponse deposit(UUID accountId, BigDecimal amount) {
        log.info("Processing deposit: {} to account: {}", amount, accountId);

        // Validate amount
        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new InvalidOperationException("Deposit amount must be positive");
        }

        // Fetch account
        Account account = accountRepository.findById(accountId)
            .orElseThrow(() -> new AccountNotFoundException("Account not found: " + accountId));

        // Check account status
        if (account.getStatus() != Account.AccountStatus.ACTIVE) {
            throw new InvalidOperationException("Account is not active");
        }

        // Update balance
        account.setBalance(account.getBalance().add(amount));

        // Save (Hibernate detects changes automatically)
        Account updatedAccount = accountRepository.save(account);

        log.info("Deposit successful. New balance: {}", updatedAccount.getBalance());

        return mapToResponse(updatedAccount);
    }

    @Override
    public AccountResponse withdraw(UUID accountId, BigDecimal amount) {
        log.info("Processing withdrawal: {} from account: {}", amount, accountId);

        // Validate amount
        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new InvalidOperationException("Withdrawal amount must be positive");
        }

        // Fetch account with pessimistic lock (prevents concurrent withdrawals)
        Account account = accountRepository.findById(accountId)
            .orElseThrow(() -> new AccountNotFoundException("Account not found: " + accountId));

        // Check account status
        if (account.getStatus() != Account.AccountStatus.ACTIVE) {
            throw new InvalidOperationException("Account is not active");
        }

        // Check sufficient funds
        if (account.getBalance().compareTo(amount) < 0) {
            throw new InsufficientFundsException(
                String.format("Insufficient funds. Available: %s, Requested: %s",
                    account.getBalance(), amount)
            );
        }

        // Update balance
        account.setBalance(account.getBalance().subtract(amount));

        Account updatedAccount = accountRepository.save(account);

        log.info("Withdrawal successful. New balance: {}", updatedAccount.getBalance());

        return mapToResponse(updatedAccount);
    }

    @Override
    public AccountResponse closeAccount(UUID accountId) {
        log.info("Closing account: {}", accountId);

        Account account = accountRepository.findById(accountId)
            .orElseThrow(() -> new AccountNotFoundException("Account not found: " + accountId));

        // Business rule: Can only close account with zero balance
        if (account.getBalance().compareTo(BigDecimal.ZERO) != 0) {
            throw new InvalidOperationException("Cannot close account with non-zero balance");
        }

        account.setStatus(Account.AccountStatus.CLOSED);
        Account closedAccount = accountRepository.save(account);

        log.info("Account closed successfully: {}", accountId);

        return mapToResponse(closedAccount);
    }

    @Override
    public void deleteAccount(UUID accountId) {
        log.info("Deleting account: {}", accountId);

        if (!accountRepository.existsById(accountId)) {
            throw new AccountNotFoundException("Account not found: " + accountId);
        }

        accountRepository.deleteById(accountId);

        log.info("Account deleted: {}", accountId);
    }

    // Helper method to generate account number
    private String generateAccountNumber() {
        // In real application, use proper account number generation algorithm
        return "ACC" + System.currentTimeMillis();
    }

    // Mapper method (or use MapStruct in real applications)
    private AccountResponse mapToResponse(Account account) {
        return AccountResponse.builder()
            .id(account.getId())
            .accountNumber(account.getAccountNumber())
            .customerId(account.getCustomerId())
            .accountType(account.getAccountType())
            .balance(account.getBalance())
            .status(account.getStatus())
            .createdAt(account.getCreatedAt())
            .updatedAt(account.getUpdatedAt())
            .build();
    }
}
```

This is a substantial start to the training document. I need to continue with more sections. Let me mark this todo as complete and continue.
