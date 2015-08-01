require_relative 'contact_database'
require 'pry'

class Contact
 
  attr_accessor :name,:email

  def initialize(name,email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end


  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  @@contacts = []
  class << self
    
    # def add_phone(phone_label,phone_number,email)
    #   FasterCSV.open('contacts.csv','w') do |csv|
    #     FasterCSV.foreach('contacts.csv') do |row|
    #       csv << (row + [phone_number])
    #     end
    #   end
    # end




    def create(new_name, new_email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contacts = CSV.read('contacts.csv')
      contacts.each do |name,email| 
        if new_email == email
          puts "This email already exists!"
          return
        end
      end
      @@contacts << new_name
      @@contacts << new_email      
      Csv.implement(@@contacts[0],@@contacts[1])    
    end
      
    
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      puts "The following contacts match your term: "
      contacts = CSV.read('contacts.csv')
      # contacts[0]
      # binding.pry
      contacts.each do |name,email|
        # binding.pry
        if name.include?(term) || email.include?(term)
          puts " #{name}, #{email}"
        end
      end
    end

 
    def all
      # TODO: Return the list of contacts, as is
      count = 0
      contacts = CSV.read('contacts.csv')
      contacts.each do |name, email|
        if count == 0
          puts "   #{name} (#{email})"
          count += 1
        else
          puts "#{count}: #{name} (#{email})"
          count += 1
        end
      end
    end
    

    def show(id)
      # TODO: Show a contact, based on ID
      line = CSV.readlines("contacts.csv")[id]
      puts "Cantact ##{id} is #{line[0]} with email:#{line[1]}"
    end


    
  end
 
end