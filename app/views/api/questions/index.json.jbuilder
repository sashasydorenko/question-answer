json.array!(@api_questions) do |api_question|
  json.extract! api_question, :id, :status, :title, :body, :comments_count, :category_id
end
