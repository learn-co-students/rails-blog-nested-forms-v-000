json.array!(@create_posts) do |create_post|
  json.extract! create_post, :id
  json.url create_post_url(create_post, format: :json)
end
