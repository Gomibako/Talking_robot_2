require 'pry'

class Person
  def self.get_user_name
    puts "What's your name?"
    gets.chomp.capitalize
  end

  def self.get_user_age
    puts"How old are you?"
    gets.chomp.to_i
  end

  def self.get_user_gender
    puts "Are you a Male or Female?[MF]"
    gets.chomp.upcase
  end

  def self.get_user_spaghetti
    puts "Do you like your spaghetti long or cut[LC]"
    gets.chomp.chars.first.downcase == "l" ? "long" : "cut"
  end

  attr_accessor  :name, :gender, :age, :spaghetti
  def initialize(args = {})
    @name          = args[:name]
    @gender        = args[:gender]
    @age           = args[:age]
    @spaghetti     = args[:spaghetti]
  end

  def young?
    @age <= 16
  end 

  def old?
    @age >= 100
  end

  def when_is_user_is_75
    delta = (75 - age).abs
    case age
    when 0..74
      puts "You'll be 75 in #{delta} years."
    when 75
      puts "You're 75!!!!"
    when 76..150
      puts "You turned 75 #{delta} years ago."
    end
  end
end