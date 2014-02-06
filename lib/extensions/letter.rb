#letter_ext.rb

class EventManager
	private

	def create_form_letter row
		name = EventManager.fix_name(row[:first_name])
		zipcode = EventManager.clean_zipcode(row[:zipcode])
		legislators = EventManager.legislators_by_zipcode(zipcode)
		@erb_template.result(binding)
	end

	def self.fix_name name
		name.downcase.capitalize
	end

end
