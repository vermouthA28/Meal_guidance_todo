# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(last_name:  "福崎",
             first_name: "歩実",
             email: "ayumi_fukuzaki@example.com",
             password:  "123456",
             password_confirmation: "123456",
             admin: true)
User.create!(last_name:  "令和",
             first_name: "道子",
             email: "reiwa_mitiko@example.com",
             password:  "654321",
             password_confirmation: "654321",
             admin: true)
