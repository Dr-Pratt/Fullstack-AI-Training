# Contributing to Full Stack AI Engineer Training Program

Thank you for your interest in contributing to this training program! We welcome contributions that improve the learning experience for others.

## How to Contribute

### Types of Contributions Welcome

- Bug fixes or typos in documentation
- Additional resources, tutorials, or examples
- Improved explanations or clarifications
- New templates or tracking tools
- Updates to reflect latest technologies
- Translations (if applicable)
- Additional AI prompts or examples

### Not Accepting

- Major structural changes without prior discussion
- Content that deviates from the program's focus
- Proprietary or copyrighted materials

---

## Getting Started

### 1. Fork the Repository

Click the "Fork" button at the top right of the repository page to create your own copy.

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR-USERNAME/fullstack-ai-training.git
cd fullstack-ai-training
```

### 3. Set Up Remote

Add the original repository as an upstream remote:

```bash
git remote add upstream https://github.com/ORIGINAL-OWNER/fullstack-ai-training.git
```

### 4. Create a Branch

Always create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
```

Branch naming conventions:
- `feature/` - New features or additions
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring

Examples:
- `feature/add-docker-template`
- `fix/typo-in-week-3`
- `docs/update-setup-instructions`

---

## Making Changes

### Before You Start

1. **Check existing issues** - Someone might already be working on it
2. **Open an issue** - For significant changes, discuss first
3. **Keep changes focused** - One PR should address one concern
4. **Follow existing style** - Match the formatting and tone

### Markdown Files

When editing markdown files:
- Use proper heading hierarchy (H1 → H2 → H3)
- Include code blocks with language specification
- Keep line length reasonable (80-100 characters when possible)
- Use consistent formatting for lists and code examples

### Templates

When adding or modifying templates:
- Make them copy-paste ready
- Include clear instructions
- Use placeholders like `[YOUR_NAME]`, `[PROJECT_NAME]`
- Provide examples where helpful

---

## Committing Your Changes

### Commit Message Format

Use clear, descriptive commit messages:

```
<type>: <short summary>

<optional detailed description>
```

Types:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Formatting, typos
- `refactor` - Code restructuring
- `test` - Adding tests
- `chore` - Maintenance tasks

Examples:
```
docs: Fix typo in Week 3 Spring Boot section

feat: Add Docker Compose template for local development

Includes template for running PostgreSQL, Redis, and the application
in containers for easy local setup.

fix: Correct broken link in AI prompting guide
```

### Commit Your Changes

```bash
git add .
git commit -m "docs: Fix typo in Week 3 section"
```

---

## Submitting a Pull Request

### 1. Update Your Branch

Before submitting, make sure your branch is up to date:

```bash
git fetch upstream
git rebase upstream/main
```

### 2. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 3. Create Pull Request

1. Go to your fork on GitHub
2. Click "Compare & pull request"
3. Fill out the PR template:

**Title**: Brief description (e.g., "Add Docker template for Week 1")

**Description**:
```
## What does this PR do?
- Adds a new Docker Compose template
- Updates Week 1 setup instructions
- Includes example .env file

## Why is this needed?
Makes it easier for beginners to set up local development environment

## Testing
- [ ] Tested Docker Compose setup on Mac
- [ ] Verified all services start correctly
- [ ] Updated documentation is clear

## Related Issues
Fixes #123
```

### 4. PR Checklist

Before submitting, ensure:
- [ ] Branch is up to date with main
- [ ] Commit messages are clear and descriptive
- [ ] Changes are focused and minimal
- [ ] Documentation is updated (if needed)
- [ ] No sensitive information (API keys, passwords)
- [ ] Markdown renders correctly
- [ ] Links are functional
- [ ] Spelling and grammar checked

---

## Code Review Process

### What to Expect

1. **Initial Review** - Maintainer will review within 3-7 days
2. **Feedback** - You may be asked to make changes
3. **Discussion** - Questions or suggestions may be provided
4. **Approval** - Once approved, PR will be merged
5. **Recognition** - Contributors will be acknowledged

### Responding to Feedback

- Be open to suggestions
- Ask questions if feedback is unclear
- Make requested changes promptly
- Update your PR branch as needed
- Be respectful and professional

### Making Changes After Review

```bash
# Make your changes
git add .
git commit -m "refactor: Address review feedback"
git push origin feature/your-feature-name
```

The PR will automatically update.

---

## Development Setup

### Prerequisites

- Git installed and configured
- Text editor (VS Code, Sublime, etc.)
- Markdown preview capability (recommended)

### Testing Your Changes

Before submitting:

1. **Preview Markdown Files**
   - Use VS Code's markdown preview
   - Or use online tools like [StackEdit](https://stackedit.io/)

2. **Check Links**
   - Verify all hyperlinks work
   - Test relative paths

3. **Spell Check**
   - Run spell checker on new content
   - Proofread carefully

4. **Format Check**
   - Ensure consistent spacing
   - Check list formatting
   - Verify code blocks render properly

---

## Style Guidelines

### Documentation Style

- **Tone**: Professional but friendly
- **Audience**: Technology leaders transitioning to hands-on roles
- **Level**: Assumes some technical background
- **Examples**: Use banking/fintech domain when possible

### Writing Tips

- Use active voice
- Keep sentences concise
- Break up long paragraphs
- Use bullet points and lists
- Include code examples where helpful
- Define acronyms on first use

### Code Examples

```javascript
// Good: Clear, commented, complete example
const express = require('express');
const app = express();

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'healthy' });
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});
```

---

## Questions or Problems?

### Getting Help

1. **Check existing issues** - Your question may be answered
2. **Open a new issue** - For questions or discussions
3. **Be specific** - Provide context and details
4. **Be patient** - Maintainers will respond when available

### Issue Template

```
## Question/Problem
[Describe your question or problem]

## Context
[What section/week are you referring to?]

## What I've Tried
[Steps you've already taken]

## Additional Information
[Any other relevant details]
```

---

## Recognition

Contributors will be acknowledged in:
- README contributors section (planned)
- Release notes
- Special thanks in major updates

Your contributions help others on their journey to becoming Full Stack AI Engineers!

---

## License

By contributing, you agree that your contributions will be licensed under the same terms as the project.

---

## Thank You!

Every contribution, no matter how small, makes this training program better for the community. We appreciate your time and effort!

**Questions?** Open an issue or reach out through GitHub discussions.

---

**Last Updated**: January 18, 2026
**Version**: 1.0
