# == Schema Information
#
# Table name: comentarios
#
#  id         :integer          not null, primary key
#  autor      :string(255)
#  conteudo   :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comentario < ActiveRecord::Base
  belongs_to :post
end
