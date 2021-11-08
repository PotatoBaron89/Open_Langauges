json.extract! user, :id, :name, :email, :dob, :display_name, :about, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
