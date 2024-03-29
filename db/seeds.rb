# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClassList.destroy_all
ClassEducator.destroy_all


CourseChannel.destroy_all
Tag.destroy_all
CourseTag.destroy_all
Flashcard.destroy_all
Inbox.destroy_all
Message.destroy_all
Result.destroy_all
Question.destroy_all
Role.destroy_all
Category.destroy_all
Role.destroy_all
Like.destroy_all
Subscribe.destroy_all
Wish.destroy_all
Word.destroy_all
Definition.destroy_all
Quiz.destroy_all
FlashcardList.destroy_all
# Lesson.destroy_all
Course.destroy_all
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

while i < 40 do
  Course.create!([{
                    title: Faker::Educator.course_name,
                    contents: Faker::Lorem.sentence(word_count: rand(70...150)),
                    user: @users.sample,
                    isarchived: rand(2),
                    Ispremium: rand(2),
                    price: Faker::Number.between(from: 2.0, to: 15.0).round(2)
                  }])

  # Ensure every class has at least one educator, needed to seed lessons
  ClassEducator.create(user_id: @users.sample.id, course_id: Course.last.id)
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
while i < 100 do
  Lesson.create!([{
                    title: Faker::Educator.subject,
                    content: Faker::Lorem.sentence(word_count: rand(50...80)),
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

@lesson = Lesson.all
70.times do
  Quiz.create!(lesson_id: @lesson.sample.id, title: Faker::JapaneseMedia::StudioGhibli.character )
end

@quiz = Quiz.all

200.times do
  Question.create!(question: Faker::JapaneseMedia::StudioGhibli.quote, answer: Faker::Movies::HitchhikersGuideToTheGalaxy.quote, quiz_id: @quiz.sample.id)
end

55.times do
  FlashcardList.create!(lesson_id: @lesson.sample.id, title: Faker::JapaneseMedia::StudioGhibli.quote)
end

@flashcardlist = FlashcardList.all

200.times do
  Flashcard.create!(side_one: Faker::LoremFlickr.image(size: "300x300", search_terms: ['animals']),
                    side_two: Faker::Creature::Animal.name, flashcard_list_id: @flashcardlist.sample.id)
end