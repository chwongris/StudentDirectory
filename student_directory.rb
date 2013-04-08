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
person = Person.create_person("Student")
person.name = params[:name]
person.email = params[:email]
person.type = person.class.to_s
person.reason_for_joining = params[:reason]
person.save
redirect '/'
end

post '/outputinstructor' do
person = Person.create_person("Instructor")
person.name = params[:name]
person.email = params[:email]
person.type = @person.class.to_s
person.iq = params[:iq] 
person.save
# erb :outputinstructor
redirect '/'
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


