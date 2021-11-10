# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClassList.destroy_all
ClassEducator.destroy_all

Course.destroy_all

Like.destroy_all
Subscribe.destroy_all
Wish.destroy_all

User.destroy_all





User.create!(email: "potato@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "potato123@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "samboy29@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user123@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "us423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "usr423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "ur423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user422133@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user412412423@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "user424123@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "I_Am_Potato3@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "Love_Potatoes@gmail.com", password: 'potato', password_confirmation: 'potato')
User.create!(email: "Poooo-taaaa-toooooo@gmail.com", password: 'potato', password_confirmation: 'potato')


@users = User.all

Course.create(title: "Random Title", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "Another Title", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "This is interesting", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "Oh wow", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "How to tie your shoelaces", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "How to tie your shoelaces", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "How read gibberish", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "How to eat a cake in under 3 seconds", contents: "Words here", user_id: @users.sample.id)
Course.create(title: "How to peel a potato", contents: "Words here", user_id: @users.sample.id)

@courses = Course.all

ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)

ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)

Like.create(user_id: @users[0].id, course_id: @courses[0].id)
Like.create(user_id: @users[0].id, course_id: @courses[1].id)
Like.create(user_id: @users[0].id, course_id: @courses[3].id)
Like.create(user_id: @users[0].id, course_id: @courses[5].id)
Like.create(user_id: @users[1].id, course_id: @courses[4].id)
Like.create(user_id: @users[1].id, course_id: @courses[0].id)
Like.create(user_id: @users[1].id, course_id: @courses[3].id)
Like.create(user_id: @users[2].id, course_id: @courses[0].id)
Like.create(user_id: @users[2].id, course_id: @courses[5].id)
Like.create(user_id: @users[2].id, course_id: @courses[4].id)
Like.create(user_id: @users[2].id, course_id: @courses[3].id)
Like.create(user_id: @users[3].id, course_id: @courses[0].id)
Like.create(user_id: @users[3].id, course_id: @courses[1].id)
Like.create(user_id: @users[3].id, course_id: @courses[7].id)
Like.create(user_id: @users[4].id, course_id: @courses[0].id)
Like.create(user_id: @users[5].id, course_id: @courses[8].id)
Like.create(user_id: @users[6].id, course_id: @courses[0].id)
Like.create(user_id: @users[7].id, course_id: @courses[0].id)


Wish.create(user_id: @users[3].id, course_id: @courses[3].id)
Wish.create(user_id: @users[4].id, course_id: @courses[2].id)
Wish.create(user_id: @users[2].id, course_id: @courses[3].id)
Wish.create(user_id: @users[6].id, course_id: @courses[1].id)
Wish.create(user_id: @users[1].id, course_id: @courses[0].id)
Wish.create(user_id: @users[0].id, course_id: @courses[4].id)




Subscribe.create(user_id: @users[0].id, course_id: @courses[0].id)
Subscribe.create(user_id: @users[1].id, course_id: @courses[0].id)
Subscribe.create(user_id: @users[2].id, course_id: @courses[0].id)
Subscribe.create(user_id: @users[3].id, course_id: @courses[1].id)
Subscribe.create(user_id: @users[2].id, course_id: @courses[1].id)
Subscribe.create(user_id: @users[4].id, course_id: @courses[1].id)


Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "Intriguing Lesson", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "Dolphin Dancing", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "Lion Taming", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "Basket Weaving", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "How to burn potatoes", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "How to avoid police in a wheelchair", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[2].id, title: "Stuff made here", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[2].id, title: "I am strugglign to think of lessons", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[1].id, title: "Rails on Ruby", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[1].id, title: "VUE is the best", content: "Sample Content")
Lesson.create!(user_id: @users[0].id, course_id: @courses[0].id, title: "No no no not vim!", content: "Sample Content")
