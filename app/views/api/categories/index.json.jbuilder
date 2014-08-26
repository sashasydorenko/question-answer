json.array!(@api_categories) do |api_category|
  json.extract! api_category, :id, :name, :count
end
