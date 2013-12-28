# == Schema Information
#
# Table name: posts
#
#  id                  :integer          not null, primary key
#  titulo              :string(255)
#  conteudo            :text
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Post < ActiveRecord::Base
	has_many :comentarios
	validates :titulo, :presence => true, :length => {:minimum => 10}
	validates :conteudo, :presence => true
	has_attached_file :avatar, :styles => { :medium => "600x600>", :small => "400x400>" }, :default_url => "/images/:style/missing.png"

	geocoded_by :address
	after_validation :geocode

	acts_as_taggable
end
