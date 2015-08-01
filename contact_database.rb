## TODO: Implement CSV reading/writing
require 'csv'


class Csv
	
	class << self
		
		def implement(name,email)
			
			CSV.open("contacts.csv","a") do |csv|
				csv << [name,email]
				puts "Contact: #{name} is added!"
			end
		end
	end
end