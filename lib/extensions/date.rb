#date_row.rb

class EventManager
	private
	def self.hr_and_day_from date_obj
		[date_obj.strftime("%l %P"), date_obj.strftime("%a")]
	end
	
	def self.parse_date	string
		DateTime.strptime(string, '%D %R')
	end

	def self.sort_by_max counter_hash
		#hashes do not include sort methods
		sorted_times = counter_hash.keys.sort do |a,b|
			counter_hash[b] <=> counter_hash[a]
		end
		sorted_hash = {}
		sorted_times.each do |hour|
			sorted_hash[hour] = counter_hash[hour]
		end
		sorted_hash
	end

	def increment_sign_up_count row
		date = EventManager.parse_date(row[:regdate])
		hour_of_day,day_of_week = EventManager.hr_and_day_from date
		@sign_up_count[:hours][hour_of_day.to_sym] += 1
		@sign_up_count[:week_days][day_of_week.to_sym] +=1
	end

end