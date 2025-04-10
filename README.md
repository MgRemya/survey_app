# 📋 Survey App - Ruby on Rails

A dynamic and scalable survey platform built with Ruby on Rails, allowing superadmins to manage surveys and users, while users can securely participate and track their performance via detailed KPIs.

---

## 🚀 Features

### Superadmin

- Upload users via CSV (auto generates password & sends email)
- Create surveys with multiple categories and questions
- Manage answers and assign score values
- View complete KPI dashboard per user
- Preview user responses with scoring/classification

### Users

- Login with provided credentials
- Attempt surveys (single attempt)
- View preview after completion with:
  - Response summary
  - Category-wise KPI breakdown
  - Total score & engagement

### KPIs Implemented

- ✅ Average Score per Category
- ✅ Engagement Index (% of max score)
- ✅ High-Performance Answers (% of answers with score 4/5)
- ✅ Classification per category: Poor, Average, Good, Very Proficient

---

## 🗃️ Schema Overview

- `User`
- `Survey`
- `Category` (belongs to Survey)
- `Question` (belongs to Category)
- `Answer` (predefined, 5-scale)
- `UserSurvey` (1 record per user per survey)
- `UserSurveyResponse` (tracks answers per question)

---

## ⚙️ Setup Instructions

1. **Clone the repo**

```bash
git clone https://github.com/YOUR_USERNAME/survey_app.git
cd survey_app
```

2. **Install dependencies**

```bash
bundle install
```

3. **Setup database**

```bash
rails db:create db:migrate db:seed
```

4. **Start the server**

```bash
rails server
```

5. **Login as Superadmin** Check `db/seeds.rb` for the default superadmin email/password.

---

## 📦 To-Do & Improvements

User change password option
User management from admi side
Graphical representation of KPI in superadmin dashboard.
Download option.

- ***
