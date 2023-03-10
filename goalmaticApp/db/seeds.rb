# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sleep = Category.create({name: "Sleep"})
study = Category.create({name: "Study"})

sleep_40 = Challenge.create({
  name: "Sleep 40 hours a week",
  category: sleep,
  goal: 40,
  progress: 0,
  ends_at: Date.parse("2023-12-31"),
  units: "hours"
})

study_18 = Challenge.create({
  name: "Study 18 hours a week",
  category: study,
  goal: 18,
  progress: 0,
  ends_at: Date.parse("2023-12-31"),
  units: "hours"
})

slept_8 = Activity.create({
  challenge: sleep_40,
  amount: 8,
  name: "Went to bed on time"
})

studied_3 = Activity.create({
    challenge:  study_18,
    amount: 3,
    name: "Got it done right after lunch"
  })