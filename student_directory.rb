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
@student = Person.create_person("Student")
@student.name = params[:name]
@student.email = params[:email]
@student.type = @student.class.to_s
@student.reason_for_joining = params[:reason]
@student.save
 
  erb :outputstudent
end

post '/outputinstructor' do
@instructor = Person.create_person("Instructor")
@instructor.name = params[:name]
@instructor.email = params[:email]
@instructor.type = @instructor.class.to_s
@instructor.iq = params[:iq] 
@instructor.save
erb :outputinstructor
end




#     when 'p'
#     results = Person.all
#     results.each do |row|
#       puts row
#     end
    

#     when 's'
#       # Ask the user to enter a search term
#       print "Please enter the search term that you're looking for: "

#     puts Person.find_by_name(search)


