json.array!(@comentarios) do |comentario|
  json.extract! comentario, :autor, :conteudo, :post_id
  json.url comentario_url(comentario, format: :json)
end
