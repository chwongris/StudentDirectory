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



post '/questions' do
  if params[:SorI] == "Student"
    redirect '/Student'
  else
    redirect '/Instructor'
end
end

get '/Student' do
 erb :student
end

get '/Instructor' do
 erb :instructor
end

post '/outputstudent' do
a = Person.create_person("Student")
a.name = params[:name]
a.email = params[:email]
a.type = a.class.to_s
a.reason_for_joining = params[:reason]
a.save
  erb :outputstudent, :locals => {
    :type => a.type,
    :name => a.name,
    :email => a.email,
    :reason => a.reason_for_joining
}
end

post '/outputinstructor' do
b = Person.create_person("Instructor")
b.name = params[:name]
b.email = params[:email]
b.type = b.class.to_s
b.iq = params[:iq] 
b.save
  erb :outputinstructor, :locals => {
    :type => b.type,
    :name => b.name,
    :email => b.email,
    :iq => b.iq.to_s
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
