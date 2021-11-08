# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "potato@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "potato123@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "samboy29@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user123@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "I_Am_Potato3@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "Love_Potatoes@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "Poooo-taaaa-toooooo@gmail.com", password: 'potato', password_confirmation: 'potato')


Course.create(title: "Random Title", contents: "Words here", creator_id: 1)
Course.create(title: "Another Title", contents: "Words go here", creator_id: 1)
Course.create(title: "This is interesting", contents: "Words ... here", creator_id: 2)

ClassList.create(user_id:2, course_id: 1)
ClassList.create(user_id:2, course_id: 2)
ClassList.create(user_id:4, course_id: 1)
ClassList.create(user_id:4, course_id: 2)
ClassList.create(user_id:5, course_id: 1)
ClassList.create(user_id:6, course_id: 1)
ClassList.create(user_id:6, course_id: 3)
ClassList.create(user_id:7, course_id: 1)
ClassList.create(user_id:7, course_id: 3)

ClassEducator.create(user_id: 2, course_id: 1)
ClassEducator.create(user_id: 3, course_id: 1)


