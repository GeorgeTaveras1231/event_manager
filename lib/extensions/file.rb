
class EventManager
	private
	def directory
		"#{@name}/"
	end

	def create_dir
		Dir.mkdir @name unless Dir.exists? @name
	end

	def confirm_files *files
		files.each do |file|
			raise "Failed to load #{file}" unless File.exists? file
		end
	end

	def save_phone_numbers
		filename = "#{directory}valid_phone_numbers.txt"
	
		File.open(filename,'w') do |file|
			file.puts "These are all the valid phone numbers we collected\n\n"
			@valid_phone_numbers.each do |name, phone|
				file.puts "#{name}:#{" ".rjust(40-name.size)}#{phone}"
			end
		end
	end

	def save_thank_you_letter row
		id = row[0]
		form_letter = create_form_letter(row)
		out_directory = "#{directory}output/"

		Dir.mkdir out_directory unless Dir.exists? out_directory
	
		filename = "#{out_directory}thanks_#{id}.html"
	
		File.open(filename,'w') do |file|
			file.puts form_letter
		end
	end

	def save_sign_up_count_sheet
		filename = "#{directory}sign_up_count_sheet.txt"

		File.open(filename,'w') do |file|
			file.puts "This is a list of our sign ups according to the specified time.\n\n"
			file.puts "Time/Day#{" ".rjust(12)}# of sign_ups\n\n"
			@sign_up_count.each do |target, stats|
				file.puts "#{target.to_s.upcase.gsub("_"," ")}\n\n"
				EventManager.sort_by_max(stats).each do |time, sign_ups|
					file.puts "#{time}#{" ".rjust(20-time.size)}#{sign_ups}"
				end
				file.puts "\n\n"
			end
		end
	end
end