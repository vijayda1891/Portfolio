class Portfol < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.bayern
		where(subtitle: 'Bayern')
	end

	scope :robben, -> { where(subtitle: 'Robben') } 

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://via.placeholder.com/600x400"
		self.thumb_image ||= "https://via.placeholder.com/350x200"
	end
end
