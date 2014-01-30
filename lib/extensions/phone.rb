#phone_ext.rb

class EventManager
	private
	def self.validate_phone_number phone_number
		digits = phone_number.to_s.split("").select do |character|
			#extract digits
			character =~ /[\d]/
		end.join
	
		if digits.size == 10
			digits
		elsif digits.size == 11 && digits.start_with?("1")
			digits[1..10]
		else
			nil
		end
	end

	def store_valid_phone_numbers row
		full_name = [row[:first_name],row[:last_name]].map {|name| EventManager.fix_name(name)}.join " "
		phone_number = EventManager.validate_phone_number(row[:homephone])
		@valid_phone_numbers[full_name] = phone_number unless phone_number.nil?
	end
end