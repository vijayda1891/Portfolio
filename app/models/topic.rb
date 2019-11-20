class Topic < ApplicationRecord
	validates_presence_of :title

	has_many :blogs

	def self.no_blogs
		includes(:blogs).where.not(blogs: {id: nil})
	end
end
