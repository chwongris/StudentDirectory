  class Student < Person
  attr_accessor :reason_for_joining

  # Prompt the user for questions, including those extra quetions pertaining to 
  # Student objects
  #

  #  def initialize
  #   self.ask_questions
  # end
  
  # def ask_questions
  #   super
  #   self.reason_for_joining = @reason

  # end

  # Provides a String that represents this Student, try me with puts!
  # 
  def to_s
    "ID: #{self.id}
    Type: #{self.class}
    Name: #{self.name}
    Email: #{self.email}
    Reason For Joining: #{self.reason_for_joining}"
  end

  # TODO - Persists this Instructor object to the database
  #
  def save
    # Build a String of SQL, that will insert all the attributes into the persons table

    # Execute the SQL on the @@db object
    
    sql = "Insert into people (type, name, email, reason_for_joining) values (?,?,?,?)"
    @@db.execute(sql, self.class.to_s, name, email, reason_for_joining)

  end

end