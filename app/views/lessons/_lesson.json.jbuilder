json.extract! lesson, :id, :title, :content, :user_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
json.content lesson.content.to_s
