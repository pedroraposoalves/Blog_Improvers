class Post < ActiveRecord::Base
	has_many :comentarios
	belongs_to :category
	validates :titulo, :presence => true, :length => {:minimum => 10}
	validates :conteudo, :presence => true
end
