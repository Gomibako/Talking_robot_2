require 'pry'

class Person
  attr_accessor  :instance_args
  def initialize(args = {})
    @name          = args[:name]
    @gender        = args[:gender]
    @age           = args[:age]
  end

  def get_name
    @name
  end

  def get_age
    @age  
  end

  def get_gender
    @gender 
  end

  def young?
    @age <= 16
  end

  def old?
    @age >= 100
  end

  def when_is_user_is_75
    delta = (75 - @instance_args[:age]).abs
    case @instance_args[:age]
    when 0..74
      "You'll be 75 in #{delta} years."
    when 75
      "You're 75!!!!"
    when 76..150
      "You turned 75 #{delta} years ago."
    end
  end

  def set_age_description
    if young?
      @instance_args[:description] = @instance_args[:gender] == "M" ? "boy" : "girl"
    elsif old?
      @instance_args[:description] = @instance_args[:gender] == "M" ? "father" : "mother"
    end  
  end

  def get_grandparent_status?      
    @instance_args[:has_grandkids] = gets.chomp.upcase
    @instance_args[:has_grandkids] == "Y"
  end

  def ask_initial_ok?
    @instance_args[:initial_ok] = gets.chomp.upcase 
    @instance_args[:initial_ok] == "N"
  end
end