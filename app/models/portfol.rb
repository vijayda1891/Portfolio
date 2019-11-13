class Portfol < ApplicationRecord
	has_many :technologies, dependent: :nullify
	accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	def self.bayern
		where(subtitle: 'Bayern')
	end

	scope :robben, -> { where(subtitle: 'Robben') } 


	def self.by_position
		order("position ASC")
	end
end
