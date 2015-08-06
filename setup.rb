require 'pry' # in case you want to use binding.pry
require 'active_record'
require_relative 'lib/contact'
require_relative 'lib/phone'

ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contacts',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.table_exists?(:contacts)
    create_table :contacts do |t|
      t.column :firstname, :string
      t.column :lastname, :string
      t.column :email, :string
      t.timestamps null: false
    end
  end

  unless ActiveRecord::Base.connection.table_exists?(:phones)
    create_table :phones do |t|
      t.references :contact
      t.column :phone_label, :string
      t.column :phone_number, :string
      t.timestamps null: false
    end
  end
end