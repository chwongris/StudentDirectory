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

# get '/SorI' do
#   erb :SorI
# end

post '/entry' do
a = Person.create_person(params[:SorI])
a.name = params[:name]
a.email = params[:email]
a.type = a.class.to_s

if params[:SorI] == "Student"
a.reason_for_joining = params[:reason]
a.save
  erb :output, :locals => {
    :type => a.type,
    :name => a.name,
    :email => a.email,
    :reason => a.reason_for_joining
  } 

else
a.iq = params[:reason] 
a.save
  erb :output, :locals => {
    :type => a.type,
    :name => a.name,
    :email => a.email,
    :reason => a.iq
  }
end
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