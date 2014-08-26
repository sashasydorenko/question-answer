json.array!(@api_comments) do |api_comment|
  json.extract! api_comment, :id, :body, :question_id
end
