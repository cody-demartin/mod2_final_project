json.extract! answer, :id, :title, :body, :question_id, :user_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
