require './Author'
require './User'
# require './ShoppingList'
require 'pry'

class TalkativeRobot
  attr_reader :people
  def initialize(people = [])
    @people       = people 
    @user         = nil
  end

  def get_user_info
    @user = {name: get_user_name, gender: get_user_gender, age: get_user_age}
  end

  def number_of_linefeeds(num)
    num.times {puts}
  end

  def is_user_ernest_message
    @user.instance_args[:name] == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."
  end

  def get_user_name
    puts "What's your name?"
    gets.chomp.capitalize
  end

  def get_user_age
    puts "How old are you?"
    gets.chomp.to_i
  end

  def get_user_gender
    puts "Are you a Male or Female?[MF]"
    gets.chomp.upcase
  end

  def grocery_item_guess(list)
    list.sample
  end

  def grab_item?
    gets.chomp.chars.first.upcase == "Y"
  end

  def load_grocery_list(file)
    grocery_list = IO.read(file).split("\n")
  end

  def user_greeting_message
    puts "Hi #{@user.instance_args[:name]}, who is #{@user.instance_args[:age]} years old!"

    puts is_user_ernest_message

    puts @user.when_is_user_is_75

    @user.set_age_description  
    puts "You are a young #{@user.instance_args[:description]}." if @user.young?
  end

  def ask_if_user_grandparent
    puts "Are you a great-great grand#{@user.instance_args[:description]}?[YN]" 
    @user.instance_args[:has_grandkids?] = @user.get_grandparent_status?              
    puts "Fantastic!!! It must be great to have grand-rugrats!!" if @user.instance_args[:has_grandkids?]
  end

  def ask_if_mind_initial
    @user.instance_args[:initial] = @user.instance_args[:name].chars.first
    puts "Do you mind if I call you #{@user.instance_args[:initial]}?[YN]"
    @user.instance_args = @user.instance_args[:initial] if @user.ask_initial_ok?
  end

  def ask_where_user_going
    puts "Hey #{@user.instance_args[:name]}, where are you going!?..."
    @user.instance_args[:destination] = gets.chomp
    puts "Can I come with you?" unless @user.instance_args[:destination] == "restroom"
    # user.instance_args[:destination] = "home"
  end

  def user_questionaire
    ask_if_user_grandparent if @user.old?
    ask_if_mind_initial
    ask_where_user_going
  end

  def get_user_questionaire
    user_greeting_message
    user_questionaire
  end

  def add_user_info
    add_user 
    get_user_questionaire
    self
  end

  def add_user 
    puts "Welcome New User!!"
    @user = User.new(get_user_info)
    # user[:author] = false  ## change 1 - remove user[:author] from add user
    @user.instance_args[:grocery_list] = load_grocery_list("grocery_list.txt")
  end

  def add_author_info
    user = Author.new 
    add_author
    get_user_questionaire
    self
  end

  def add_author
    puts "Welcome Great Creator of Content"
    @user = Author.new(get_user_info)
    get_user_info
    @user.instance_args[:author] = true         ## change 1 - remove user[:author] from add user
  end

  def author_exists?(people)
    @people.each do |person| 
    # break if person[:author] == "yes" ? true : false ## change 1 - remove user[:author] from add user
    break if person.instance_args[:author]
    end
  end

  def print_author_info
    puts "Here is the author info"
    author_info = @people.select {|person| person[:author]}.first
    # author_info = people.select {|person| person[:author] == "yes"}.first ## change 1 - remove user[:author] from add user

    author_info.each {|key, value| printf("%#s \t -- \t\t %s\n", key.capitalize, value)}
  end

  def remove_item_from_grocery_list(item)
    @user.instance_args[:grocery_list].delete(item)    
    @user.instance_args[:shopping_cart] << item
  end

  def guess_if_item_in_cart
    @user.instance_args[:grocery_list].sample
  end

  def print_grocery_list
    puts "Here is #{current_user[:grocery_list]}'s grocery list."
    @user.instance_args[:grocery_list].each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item)}
  end

  def check_user_grocery_list_items
    item_guess = guess_if_item_in_cart
    puts "Did you already grab the #{item_guess}?" 
    remove_item_from_grocery_list(item_guess) if grab_item?
    user
  end

  def print_check_grocery_list_message
      puts "Lets see if you got the items from your grocery list"
  end

  def format_update_grocery_list_to_csv_with_index  
    @user.instance_args[:grocery_list].join(",")
  end

  def remember_bread
    puts "Oh yeah, don't forget the bread?" 
    @user.instance_args[:grocery_list] << "bread"
    user
  end

  def update_grocery_list_file
    new_grocery_list = format_update_grocery_list_to_csv_with_index
    # IO.write("#{current_user[:name]}_new_grocery_list.txt", new_grocery_list)
    IO.write("new_grocery_list.csv", new_grocery_list)
  end

  def check_user_grocery_list
    number_of_list_items = @user.instance_args[:grocery_list].count
    print_check_grocery_list_message
    number_of_list_items.times {check_user_grocery_list_items}
    user
  end


  def turn_on
    ###  remove this comment from top of block when done testing -- start here

    # people << add_author_info if author_exists?(people) 

    # number_of_linefeeds(2)
    add_user_info
    puts @user
    @people << @user  # until people.count >= 2

    # number_of_linefeeds(2)

    # print_author_info(people)

    # ###  remove this comment from bottom of block when done testing -- end here

    # print_grocery_list(people)
    # check_user_grocery_list(people)
    # remember_bread(people)
    # update_grocery_list_file(people)

    # puts people
  end
end

 author = Author.new(:name=>"Martin", :age=>10, :gender=>"M", :shopping_cart=>[])
 user   = User.new(:name=>"Ernest", :age=>20, :gender=>"F", :shopping_cart=>[])
 people = [author, user]


 talkrobot  = TalkativeRobot.new(people: people)
 # talkrobot  = TalkativeRobot.new
 # binding.pry
 talkrobot.turn_on
