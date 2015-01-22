require './Author'
require './User'
# require './ShoppingList'
require 'pry'

class TalkativeRobot
  attr_reader :people
  def initialize(people = [])
    @people       = people 
  end

  def get_user_info
    {name: get_user_name, gender: get_user_gender, age: get_user_age}
  end

  def number_of_linefeeds(num)
    num.times {puts}
  end

  def is_user_ernest_message(user)
    user.get_name == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."
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

  def user_greeting_message(user)
    puts "Hi #{user.get_name}, who is #{user.get_age} years old!"

    puts is_user_ernest_message(user)

    puts user.when_is_user_is_75

    user.set_age_description  
    puts "You are a young #{user.get('description')}." if user.young?
  end

  def ask_if_user_grandparent(user)
    puts "Are you a great-great grand#{user.get('description')}?[YN]" 
    user.instance_args[:has_grandkids?] = user.get_grandparent_status?              
    puts "Fantastic!!! It must be great to have grand-rugrats!!" if user.get('has_grandkids?')
  end

  def ask_if_mind_initial(user)
    user.instance_args[:initial] = user.get_name.chars.first
    puts "Do you mind if I call you #{user.instance_args[:initial]}?[YN]"
    user.instance_args[:name] = user.get('initial') if user.ask_initial_ok?
  end

  def ask_where_user_going(user)
    puts "Hey #{user.get_name}, where are you going!?..."
    user.instance_args[:destination] = gets.chomp
    puts "Can I come with you?" unless user.get('destination') == "restroom"
    # user.instance_args[:destination] = "home"
    self
  end

  def user_questionaire(user)
    ask_if_user_grandparent(user) if user.old?
    ask_if_mind_initial(user)
    ask_where_user_going(user)
  end

  def get_user_questionaire(user)
    user_greeting_message(user)
    user_questionaire(user)
    user
  end

  def add_user_info
    user = add_user 
    get_user_questionaire(user)
    user
  end

  def add_user 
    puts "Welcome New User!!"
    user = User.new(get_user_info)
    # user[:author] = false  ## change 1 - remove user[:author] from add user
    user.add_shopping_list("grocery_list.txt")
    user
  end

  def add_author_info
    user = add_author
    get_user_questionaire(user)
    user
  end

  def add_author
    puts "Welcome Great Creator of Content"
    Author.new(get_user_info)
  end

  def author_exists?
    @people.each do |person| 
    # break if person[:author] == "yes" ? true : false ## change 1 - remove user[:author] from add user
    break if person.is_a?(Author)
    end
  end

  def print_author_info
    puts "Here is the author info"
    puts @people.select {|person| person.is_a?(Author)}
    # author_info = people.select {|person| person[:author] == "yes"}.first ## change 1 - remove user[:author] from add user
  end

  def remove_item_from_grocery_list(item)
    user.instance_args[:grocery_list].delete(item)    
    user.instance_args[:shopping_cart] << item
  end

  def guess_if_item_in_cart
    user.instance_args[:grocery_list].sample
  end

  def print_grocery_list(user)
    puts "Here is #{user.get_name}'s grocery list."
    puts user.get_grocery_list
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
    user.instance_args[:grocery_list].join(",")
  end

  def remember_bread
    puts "Oh yeah, don't forget the bread?" 
    user.instance_args[:grocery_list] << "bread"
    user
  end

  def update_grocery_list_file
    new_grocery_list = format_update_grocery_list_to_csv_with_index
    # IO.write("#{current_user[:name]}_new_grocery_list.txt", new_grocery_list)
    IO.write("new_grocery_list.csv", new_grocery_list)
  end

  def check_user_grocery_list(user)
    number_of_list_items = user.get_grocery_list.count
    print_check_grocery_list_message
    number_of_list_items.times (check_user_grocery_list_items)
    user
  end


  def turn_on
    ###  remove this comment from top of block when done testing -- start here
    @people = [Author.new] 
    @people << add_user_info
    
    number_of_linefeeds(2)

    print_author_info

    ###  remove this comment from bottom of block when done testing -- end here
    current_user = @people.last
    print_grocery_list(current_user)
    check_user_grocery_list(current_user)
    # remember_bread(people)
    # update_grocery_list_file(people)

    # puts people
  end
end

# name =  User.get_name


# author  = Author.new(:name=>"Martin", :age=>10, :gender=>"M", :shopping_cart=>[])
# user0   = User.new(:name=>"Ernest", :age=>20, :gender=>"F", :shopping_cart=>[])
# user    = User.new(:name=>"John", :age=>30, :gender=>"M", :shopping_cart=>[])
# people  = [author, user0, user]


# talkrobot  = TalkativeRobot.new(people)
talkrobot  = TalkativeRobot.new
talkrobot.turn_on

