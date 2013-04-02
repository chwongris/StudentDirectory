require 'rubygems'
require 'sqlite3'
require 'pry'

# Pull in each of our class files
require_relative 'person'
require_relative 'student'
require_relative 'instructor'

# Now the program actually starts here.
#
begin
  Person.open_database "student_directory.db"
  puts "Student Directory, v0.0.3 by Dan Garland"
  print 'Enter Student or Instructor, p to print, s to search, q to quit, d to delete: '

  while ((input = gets.strip.chomp) != 'q') do


    case input
    when 'p'
    results = Person.all
    results.each do |row|
      puts row
    end
    
    when 'd'
      print "Please enter the id of the entry you want to delete: "
      id = gets.strip.chomp
      Person.deleteid(id)
    

    when 's'
      # Ask the user to enter a search term
      print "Please enter the search term that you're looking for: "
      search = gets.strip.chomp

    Person.find_by_name(search)

    else
      # Create either a Student or Instructor object, depending on the input
      person = Person.create_person(input)

      unless person.nil?
        # Prompt the user for information about a Person
        person.ask_questions

        # Save someone in our database
        person.save
      end 
    end
    
    print 'Enter Student or Instructor, p to print, s to search, q to quit, d to delete: '
  end
rescue Exception => e
  puts "Error ! #{e}"
  puts "#{e.backtrace.join "\n"}"
ensure
  # Ensure that the database is closed before we go
  Person.close_database
end