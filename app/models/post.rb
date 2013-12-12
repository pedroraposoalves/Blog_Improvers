class Post < ActiveRecord::Base
	has_many :comentarios
	validates :titulo, :presence => true, :length => {:minimum => 10}
	validates :conteudo, :presence => true
	has_attached_file :avatar, :styles => { :medium => "600x600>", :small => "400x400>" }, :default_url => "/images/:style/missing.png"
end
