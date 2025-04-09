# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# User.find_by(email: "admin@example.com")&.destroy

# User.create!(
#   name: "Super Admin",
#   email: "admin@example.com",
#   password: "password123",
#   role: "superadmin"
# )
User.create!(
  name: "User 1",
  email: "user@example.com",
  password: "password123",
  role: "user"
)
Answer.destroy_all

Answer.create!([
  { content: "Not At All",    score: 1 },
  { content: "Slightly",      score: 2 },
  { content: "Somewhat",      score: 3 },
  { content: "Mostly",        score: 4 },
  { content: "Completely",    score: 5 }
])

puts "Seeded Answers!"

