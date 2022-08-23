json.extract! lesson_result, :id, :lesson_id, :created_at, :updated_at
json.url lesson_result_url(lesson_result, format: :json)
