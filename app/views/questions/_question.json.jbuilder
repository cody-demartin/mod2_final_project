json.extract! question, :id, :title, :body, :user, :created_at, :updated_at
json.url question_url(question, format: :json)
