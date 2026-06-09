# AI Agent Prompt — Duolingo-Like Educational Platform (Ruby on Rails)

You are a Senior Ruby on Rails Architect and Full-Stack Engineer.

Your task is to build a complete production-ready monolithic educational platform inspired by Duolingo's gamification system, focused only on mathematics for elementary school students.

## IMPORTANT CONTEXT

The project already has the following configured and installed:

- Ruby on Rails
- Tailwind CSS
- SQLite
- Docker support

DO NOT spend time explaining how to install or configure Tailwind.

Assume Tailwind is already working correctly.

---

# Architecture

Build everything as a SINGLE MONOLITH.

Do NOT use:

- Microservices
- React
- Vue
- Next.js
- Separate frontend
- Hotwire alternatives unless truly necessary

Use Rails conventions whenever possible.

Prefer Rails defaults over unnecessary abstractions.

---

# Stack

Use:

- Ruby on Rails
- SQLite
- Devise
- Tailwind CSS
- RSpec
- Docker
- Puma

---

# Authentication & Authorization

Use Devise.

Implement:

- Registration
- Login
- Logout
- Password recovery
- Remember me
- Authentication filters

Use Devise best practices.

Authorization should be implemented using roles.

Roles:

- Admin
- Student

Admins can:

- Manage subjects
- Manage lessons
- Manage questions
- Manage users

Students can:

- Access lessons
- Earn XP
- View rankings
- Track progress

---

# Language Rules

IMPORTANT:

All source code must be written in English.

Examples:

- Classes
- Modules
- Methods
- Variables
- Tests
- Comments

MUST be in English.

The entire UI must be written in Brazilian Portuguese.

Examples:

- Entrar
- Registrar
- Continuar
- Próxima Lição
- Você ganhou XP

---

# Educational Platform

Target:

- Elementary School Students
- Ages 6–14

Subjects:

- Mathematics only

---

# Gamification System

Implement a Duolingo-inspired progression system.

## XP

Examples:

- Correct answer = 10 XP
- Lesson completion = 50 XP
- Daily streak bonus = 20 XP

## Levels

Example:

Level 1 → 0 XP

Level 2 → 100 XP

Level 3 → 250 XP

Level 4 → 500 XP

Continue with progressive scaling.

## Streaks

Track:

- Consecutive study days
- Last study date

Rules:

- Increase streak when studying daily
- Reset when a day is missed

## Achievements

Examples:

- Primeira Lição
- 100 XP
- 500 XP
- 1000 XP
- 7 Dias Seguidos

---

# Domain Models

## User

Fields:

- name
- email
- role
- xp
- level
- streak
- last_study_at

## Subject

Fields:

- name
- description

## Lesson

Fields:

- subject
- title
- description
- position

## Question

Fields:

- lesson
- statement
- option_a
- option_b
- option_c
- option_d
- correct_answer
- explanation

## LessonCompletion

Fields:

- user
- lesson
- score
- completed_at

## Achievement

Fields:

- name
- description
- xp_requirement

---

# Question Types

Support:

- Multiple choice
- True/False

Architecture must allow future expansion.

---

# Seed Data

Generate realistic educational seed data for mathematics only.

Create:

## Users

- Admin account
- Student account

## Subjects

- Mathematics

## Lessons

Minimum:

- 5 math lessons

## Questions

Minimum:

- 10 questions per lesson

All educational content must be written in Portuguese and limited to mathematics.

---

# Pages

## Public

- Home
- Login
- Registration

## Authenticated

- Dashboard
- Lessons
- Lesson Details
- Lesson Execution
- Profile
- Ranking
- Achievements

---

# Dashboard

Display:

- Current Level
- Total XP
- Streak
- Progress Bar
- Recent Achievements
- Completed Lessons

---

# Ranking

Leaderboard showing:

- Position
- Name
- XP
- Level

---

# Frontend

Use:

- ERB templates
- Tailwind CSS

Design goals:

- Modern
- Friendly
- Mobile-first
- Accessible
- Duolingo-inspired
- Clean and colorful

---

# Reusable Components

Whenever markup is reused, use Rails partials.

Examples:

- Navbar
- Sidebar
- XP cards
- Ranking cards
- Progress cards
- Achievement cards
- Forms
- Flash messages

Avoid duplicated HTML.

Follow Rails view best practices.

---

# SQLite Production Optimization

Optimize SQLite for production.

Requirements:

- WAL mode
- Proper indexes
- Efficient queries
- Avoid N+1 queries
- Use eager loading where appropriate

---

# Testing

Use RSpec.

Create tests for:

## Models

- Validations
- Associations
- Business rules

## Services

- XP calculations
- Level calculations
- Streak logic
- Achievement unlocking

## Requests

- Authentication
- Authorization
- CRUD endpoints

## System Tests

- User login flow
- Lesson completion flow
- Ranking flow

Aim for strong test coverage.

---

# Docker

Create a production-ready Dockerfile.

Requirements:

- Build Rails application
- Install dependencies
- Precompile assets
- Run database migrations automatically
- Start Puma

Container startup should automatically execute:

```bash
bundle exec rails db:migrate
```

before launching the application.

---

# Render Deployment

Deployment target:

Render

Provide:

- Dockerfile
- Environment variables example
- Production configuration
- Render deployment instructions

Application must work correctly on Render.

---

# Code Quality

Follow:

- Rails conventions
- SOLID when appropriate
- Clean architecture principles
- Service objects for business logic
- Thin controllers
- Fat models only when appropriate

Avoid unnecessary complexity.

---

# Git Workflow

VERY IMPORTANT:

During development, use Conventional Commits.

Examples:

```bash
feat(auth): add devise authentication

feat(gamification): implement xp system

feat(lessons): add lesson completion flow

test(user): add model specs

refactor(ranking): simplify leaderboard query

fix(streak): correct streak reset logic
```

Commit frequently as features are completed.

The project output should include a suggested commit history following Conventional Commits.

---

# Deliverables

Generate:

1. Complete Rails folder structure
2. Models
3. Migrations
4. Devise configuration
5. RSpec configuration
6. Seed data
7. Service objects
8. Controllers
9. Routes
10. ERB views
11. Tailwind integration usage
12. Partials
13. Dockerfile
14. Render deployment configuration
15. SQLite optimizations
16. Tests
17. README.md

The application must be production-ready, maintainable, and runnable with minimal setup.
