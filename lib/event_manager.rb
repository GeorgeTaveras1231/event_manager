require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

dir = "./#{File.dirname(__FILE__)}"

require "#{dir}/extensions/zipcode"
require "#{dir}/extensions/date"
require "#{dir}/extensions/phone"
require "#{dir}/extensions/letter"
require "#{dir}/extensions/file"

class EventManager

	def initialize name,csv_event_file, erb_template_file
		confirm_files csv_event_file, erb_template_file

		puts "#{name}: Event Manager Initialized!"
		Sunlight::Congress.api_key = "ff5e38c96a8a499c84a8780ba5c8add4"
		@name = name
		@contents = CSV.open csv_event_file, headers: true, header_converters: :symbol
		
		template_letter = File.read erb_template_file
		@erb_template = ERB.new template_letter
		@valid_phone_numbers = {}
		@sign_up_count = {
			:hours => Hash.new(0),
			:week_days => Hash.new(0)
		}

		create_dir
	end

	def main
		@contents.each do |row|
			store_valid_phone_numbers(row)
			increment_sign_up_count(row)
			save_thank_you_letter(row)
		end
		save_phone_numbers
		save_sign_up_count_sheet
	end
end

event_attendees = EventManager.new "event_attendees","event_attendees.csv", "form_letter.erb"
full_event_attendees = EventManager.new "full_event_attendees","full_event_attendees.csv", "form_letter.erb"
event_attendees.main
full_event_attendees.main
