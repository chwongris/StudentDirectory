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

def initialize
  get_person_info
end

def get_person_info
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "What is your github? "
    self.github_user = gets.strip.chomp
    print "What is your twitter? "
    self.twitter = gets.strip.chomp
    print "What is your fun fact? "
    self.fun_fact = gets.strip.chomp
    print "Where are you from? "
    self.hometown = gets.strip.chomp
end
end

class Student < Person
  attr_accessor :reason_for_joining
    def get_person_info
    super
    print "Why did you join the course? "
    self.reason_for_joining = gets.strip.chomp
    end
end

class Instructor < Person
    attr_accessor :type
    def get_person_info
    super
      print "What sort of instructor are you? "
      self.type = gets.strip.chomp
    end
end

@directory = []
puts "Student Directory, v0.0.1 by CWong"
prompt = "Enter Student or Instructor, l to load, q to save and quit: "
print prompt

while ((input = gets.strip.chomp) != 'q') do

  case input
  when "l"
  @directory << YAML.load_documents(File.open('student_directory.yml')) { |f| f }
  else
  person = Person.create_person(input.capitalize)
  # Append this to our yaml file
  @directory << person.to_yaml
  
  end
  print prompt
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f|
  @directory.compact.each do |person|
    f.write(person.to_yaml)
    @directory = []
  end   
} 

