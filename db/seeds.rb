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





# CREATE USERS
User.create!(email: "potato@gmail.com", password: 'potato', password_confirmation: 'potato')
User.first.add_role :admin

i = 0
while i < 150 do
  User.create!([{
                  email: Faker::Internet.email,
                  password: "potato",
                  password_confirmation: "potato",
                  first_name: Faker::Name.name,
                  dob: Faker::Date.birthday(min_age: 18, max_age: 95),
                  about: Faker::Lorem.sentence(word_count: rand(30...300))
                }])
  i += 1
end

@users = User.all

# CREATE COURSES
i = 0

while i < 150 do
  Course.create!([{
                    title: Faker::Educator.course_name,
                    contents: Faker::TvShows::GameOfThrones.quote,
                    user: @users.sample,
                    isarchived: rand(2),
                    Ispremium: rand(2),
                    price: Faker::Number.between(from: 2.0, to: 15.0).round(2)
                  }])
  i += 1
end

# CREATE ROLES
Role.create(name: "User")
Role.create(name: "Student")
Role.create(name: "Educator")
Role.create(name: "Moderator")
Role.create(name: "Admin")
Role.create(name: "Super User")

@courses = Course.all

350.times do
  ClassList.create(user_id:@users.sample.id, course_id: @courses.sample.id)
end

120.times do
  ClassEducator.create(user_id: @users.sample.id, course_id: @courses.sample.id)
end

650.times do
  begin
    Like.create(user_id: @users.sample.id, course_id: @courses.sample.id)
  rescue
    next
  end
end

130.times do
  begin
    Wish.create(user_id: @users.sample.id, course_id: @courses.sample.id)
  rescue
    next
  end
end

250.times do
  begin
    Subscribe.create(user_id: @users.sample.id, course_id: @courses.sample.id)
  rescue
    next
  end
end

@courses = Course.all
i = 0
while i < 550 do
  Lesson.create!([{
                    title: Faker::Educator.subject,
                    content: Faker::TvShows::GameOfThrones.quote,
                    user: @users.sample,
                    course_id: @courses.sample.id
                  }])
  i += 1
end

150.times do
  Word.create(word: Faker::Verb.base)
end

@words = Word.all

450.times do
  Definition.create(title: Faker::Lorem.sentence(word_count: rand(20...50)))
  Definition.create(word_id: @words.sample)
end
