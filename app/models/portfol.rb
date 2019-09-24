class Portfol < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.bayern
		where(subtitle: 'Bayern')
	end

	scope :robben, -> { where(subtitle: 'Robben') } 
end
