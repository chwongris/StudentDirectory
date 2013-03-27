require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :hometown

  def self.create_person(type)
    case type
    when "Student"
    Student.new
    when "Instructor"
    Instructor.new
    end
  end
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

@directory = ""
puts "Student Directory, v0.0.1 by CWong"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  person = nil
  person = Person.create_person(input.capitalize)

    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    print "What is your github? "
    person.github_user = gets.strip.chomp
    print "What is your twitter? "
    person.twitter = gets.strip.chomp
    print "What is your fun fact? "
    person.fun_fact = gets.strip.chomp
    print "Where are you from? "
    person.hometown = gets.strip.chomp

  case input
  when 'Student' 
    print "Why did you join the course? "
    person.reason_for_joining = gets.strip.chomp
  when 'Instructor'
    print "What sort of instructor are you? "
    person.type = gets.strip.chomp
  end

  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
  
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
