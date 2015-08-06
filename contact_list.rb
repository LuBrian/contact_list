require_relative 'setup'
# require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

command,detail = ARGV

def phone(email)
	puts "please enter your number type (mobile, business, home or...)"
	phone_label = STDIN.gets.chomp
	puts "please enter your phone number:"
	phone_number = STDIN.gets.chomp
	Contact.where(email:email).each {|contact| @id = contact.id}
	contact = Contact.find(@id)
	contact.phones.create(phone_label: phone_label,phone_number: phone_number)
end

if command == "help"
	puts "Here is a list of availiable commands:
  new  - Create a new contact
  list - List all contacts 
  show - Show s contact 
  find - Find a contact"


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
		puts "please enter the first name of the new contact: "
		firstname = STDIN.gets.chomp
		puts "please enter the last name of the new contact: "
		lastname = STDIN.gets.chomp
		Contact.create(firstname: firstname,lastname: lastname,email: email)
		puts "Add phone number?[y/n]"
		new_phone = STDIN.gets.chomp
		if new_phone == "y"
			phone(email)
		end
	end

elsif command == "list"
	Contact.all.each {|contact| puts "#{contact.firstname} #{contact.lastname} has email: #{contact.email}"}

elsif command == "show" && detail.is_a?(String)
	Contact.where(firstname:detail).each {|contact| puts "##{contact.id} #{contact.firstname} #{contact.lastname} with #{contact.email}"}
elsif command == "find"
	contact = Contact.find(detail)
	puts "##{contact.id} is #{contact.firstname} #{contact.lastname}, #{contact.email}"
elsif command == "delete"
	puts "enter the id which you want to delete: "
	id = STDIN.gets.chomp.to_i
	Contact.find(id).destroy
	puts "contact ##{id} is deleted!"
else
	raise "Type 'help' for command list!"
end




