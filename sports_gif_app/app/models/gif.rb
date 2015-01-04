class Gif < ActiveRecord::Base

	validates_presence_of :image_url, :content
	validates_presence_of :category, :author
end