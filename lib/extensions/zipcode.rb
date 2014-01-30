#zipcode_row.rb
require 'sunlight/congress'

class EventManager
	private
	def self.clean_zipcode zipcode
		zipcode.to_s.rjust(5,"0")[0...5]
	end
	
	def self.legislators_by_zipcode zipcode
		Sunlight::Congress::Legislator.by_zipcode(zipcode)

	end
end