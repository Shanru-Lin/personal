# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sleep = Category.create({name: "Sleep"})
study = Category.create({name: "Study"})
first_user = User.create({email: "chenhao.ge@duke.edu", password: "changethis!"})
sleep_40 = Challenge.create({name: "Sleep 40 hours a week", category: sleep, goal: 40, progress: 0, units: "hours", ends_at: Date.parse("2023-12-31"), user: first_user})
study_18 = Challenge.create({name: "Study 18 hours a week", category: study, goal: 18, progress: 0, units: "hours", ends_at: Date.parse("2023-12-31"), user: first_user})
Activity.create({note: "Went to bed on time", amount: 8, challenge: sleep_40, user: first_user})
Activity.create({note: "Got it done right after lunch", amount: 3, challenge: study_18, user: first_user})