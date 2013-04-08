require 'pry'
require 'sqlite3'

class Person
  attr_accessor :id
  attr_accessor :type
  attr_accessor :name
  attr_accessor :email
  
  def initialize
    Person.open_database "studentdata.db"
  end
  
  # Get a reference to the database (HINT - don't need to change this)
  #
  def self.open_database(name)
    @@db = SQLite3::Database.new(name)
  end

  # Close the database (HINT - don't need to change this)
  #
  def self.close_database
    @@db.close
  end

  # Only used for the tests, don't need to call, you can just use @@db
  def self.db
    @@db
  end

  # Builds either a Student or an Instructor, depending on the value of type
  #
  def self.create_person(type)
    case type
    when 'Student' 
      Student.new
    when 'Instructor'
      Instructor.new
    else
      nil
    end
  end

  # TODO - Return an array of either Student or Instructor objects, using information
  # stored in the database
  #

  def self.all
    people = []
    # Build a SQL String that will lookup all people in the database
    Person.open_database "studentdata.db"
    results = @@db.execute("select * from people")
    results.each do |row|
      person = Person.create_person(row[1])
      person.id = row[0]
      person.name = row[2]
      person.email = row[3]
      
      if person.class.to_s == "Student"
        person.reason_for_joining = row[4]
      elsif person.class.to_s == "Instructor"
        person.iq = row[5]
        else
      end
      people << person
      
    end
    return people
  
  end

  # TODO - Return an array of either Student or Instructor objects, using information
  # stored in the database, where the name matches the given argument
  #
  def self.find_by_name(name)
    people = []

     results = @@db.execute("select * from people where name like '%#{name}%'")


      person.id = row[0]
      person.name = row[2]
      person.email = row[3]

        if person.class.to_s == "Student"
          person.reason_for_joining = row[4]
        elsif person.class.to_s == "Instructor"
          person.iq = row[5]
        else
        end
      people << person

  
    # Build a SQL String that will lookup all people in the database
    # where the name matches

    # Execute the SQL on @@db

    # Iterate through each result, and build either a Student or an Instructor,
    # filling in the information as you go.

    return people
  end

  def self.deleteid(id)
    @@db.execute("delete from people where id = #{id}")
  end

  # Prompt the user for some questions, common to all Person classes
  # #
  # def ask_questions
  # self.name = @name
  # self.email = @email
  # binding.pry
    
  # end
end