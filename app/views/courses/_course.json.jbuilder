json.extract! course, :id, :title, :contents, :created_at, :updated_at
json.url course_url(course, format: :json)
