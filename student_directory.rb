require 'rubygems'
require 'sqlite3'
require 'pry'
require 'sinatra'

# Pull in each of our class files
require_relative 'person'
require_relative 'student'
require_relative 'instructor'

# Now the program actually starts here.
#

get '/' do
  erb :index
end

get '/entry' do
  erb :index
end

post '/entry' do
person = Person.create_person(params[:SorI])
person.name = params[:name]
person.email = params[:email]
if params[:SorI] == "Student"
person.reason_for_joining = params[:reason]
db = SQLite3::Database.new("studentdata.db")
sql = "Insert into people (type, name, email, reason_for_joining) values (?,?,?,?)"
db.execute(sql, person.class.to_s, person.name, person.email, person.reason_for_joining)
  erb :output, :locals => {
    :type => person.class.to_s,
    :name => person.name,
    :email => person.email,
    :reason => person.reason_for_joining
  } 
else
person.iq = params[:reason] 
db = SQLite3::Database.new("studentdata.db")
sql = "Insert into people (type, name, email, iq) values (?,?,?,?)"
db.execute(sql, person.class.to_s, person.name, person.email, person.iq)
  erb :output, :locals => {
    :type => person.class.to_s,
    :name => person.name,
    :email => person.email,
    :reason => person.iq
  }
end







# unless person.nil?
#         # Prompt the user for information about a Person
#         person.ask_questions

#         # Save someone in our database
#         person.save


# end
#   Person.open_database "student_directory.db"
#   puts "Student Directory, v0.0.3 by Dan Garland"
#   print 'Enter Student or Instructor, p to print, s to search, q to quit, d to delete: '


#     when 'p'
#     results = Person.all
#     results.each do |row|
#       puts row
#     end
    
    

#     when 's'
#       # Ask the user to enter a search term
#       print "Please enter the search term that you're looking for: "
#       search = gets.strip.chomp

#     puts Person.find_by_name(search)

#     else
#       # Create either a Student or Instructor object, depending on the input
   
#       end 
#     end
    
#     print 'Enter Student or Instructor, p to print, s to search, q to quit, d to delete: '
#   end
# rescue Exception => e
#   puts "Error ! #{e}"
#   puts "#{e.backtrace.join "\n"}"
# ensure
#   # Ensure that the database is closed before we go
#   Person.close_database
end