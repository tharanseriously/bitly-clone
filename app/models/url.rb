class Url < ActiveRecord::Base
	validates :short_url, uniqueness: true

	before_create :shorten
	def shorten
		self.short_url = SecureRandom.hex(6)
	end

	stud
end
