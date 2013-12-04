json.array!(@posts) do |post|
  json.extract! post, :titulo, :conteudo
  json.url post_url(post, format: :json)
end
