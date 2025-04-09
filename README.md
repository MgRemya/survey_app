# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# README.md

# Dynamic Survey System (Rails)

This is a Ruby on Rails application that allows a Superadmin to upload users via CSV, create dynamic surveys, collect user responses, and calculate KPI metrics from submitted answers.

---

## Features

- Two user roles: Superadmin and User
- Superadmin can upload users using a CSV file
- Email with password is sent to users upon creation
- Dynamic survey creation with categories, questions, and answers with scores
- Users can respond to surveys
- KPIs like average score per category, engagement index, and classification logic

---

## Setup Instructions

```bash
git clone https://github.com/your-username/dynamic-survey-app.git
cd dynamic-survey-app
bundle install
yarn install --check-files
rails db:create db:migrate
rails server
```

---

## Models Overview

```bash
rails g model User name:string email:string password_digest:string role:string
rails g model Survey title:string description:text creator_id:integer
rails g model Category name:string survey:references
rails g model Question content:text category:references
rails g model Answer content:text score:integer question:references
rails g model Response user:references survey:references
rails g model ResponseItem response:references question:references answer:references category:references score:integer
```

---

## CSV Upload Example (users.csv)

```csv
Name,Email
Alice,alice@example.com
Bob,bob@example.com
```

Service: `UserCsvUploader`

- Generate password with `SecureRandom`
- Send email using `UserMailer`

---

## KPIs Calculated

- **Average Score per Category**
- **Engagement Index** (sum of scores / total questions)
- **Performance Classification**

```ruby
def classify(score)
  case score
  when 0..1.5 then 'Poor'
  when 1.5..3 then 'Average'
  when 3..4 then 'Good'
  else 'Very Proficient'
  end
end
```

---

## Frontend Example (ERB)

`views/surveys/show.html.erb`

- Loop through categories/questions/answers
- Submit response

---

## Testing

```bash
rails test
```

---

## To Do

- User dashboard with results
- Admin dashboard with KPIs and filters
- UI enhancement (Tailwind or Bootstrap)
- Response history view

---

## License

MIT
