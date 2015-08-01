require_relative 'contact'
require_relative 'contact_database'
# require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

command,detail = ARGV

def phone(email)
	puts "please enter your number type (mobile, business, home or...)"
	phone_label = STDIN.gets.chomp
	puts "please enter your phone number:"
	phone_number = STDIN.gets.chomp
	Contact.add_phone(phone_label,phone_number,email)

end


if command == "help"
	puts "Here is a list of availiable commands:
  new  - Create a new contact
  list - List all contacts 
  show - Show s contact 
  find - Find a contact"

# puts "Enter your command please: "
# new_command = STDIN.gets.chomp

elsif command == "new"
	puts "Add phone to exist contact?[y/n]"
	add_phone = STDIN.gets.chomp
	if add_phone == "y"
		puts "please enter your exist email"
		email = STDIN.gets.chomp
		phone(email)
	elsif add_phone == "n"
		puts "please enter the email of the new contact: "
		email = STDIN.gets.chomp
		puts "please enter the name of the new contact: "
		name = STDIN.gets.chomp
		Contact.create(name,email)
		puts "Add phone number?[y/n]"
		new_phone = STDIN.gets.chomp
		if new_phone == "y"
			phone(email)
		end
	end

elsif command == "list"
	Contact.all

elsif command == "show" && detail.gsub(/[^\d]/,'').to_i > 0
	
	# id = new_command.gsub(/[^\d]/,'').to_i
	Contact.show(detail.to_i)
elsif command == "find"
	# binding.pry
	Contact.find(detail)
else
	raise "Type 'help' for command list!"
end




