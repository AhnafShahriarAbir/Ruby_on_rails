json.extract! users, :id, :name, :email, :course_id, :created_at, :updated_at
json.url users_url(users, format: :json)
