require 'uri'

class Url < ActiveRecord::Base
	validates :long_url, uniqueness: true, format: { with: URI.regexp }
	before_create :shorten_url

	def shorten_url
		self.short_url = SecureRandom.hex(5)
	end
end
