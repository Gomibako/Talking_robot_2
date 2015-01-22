require 'pry'
require './Person'
require './GroceryList'

class User < Person 
  attr_accessor :name, :age, :gender
  def initialize(args = {})
    super(args)
      @spaghetti     = args[:spaghetti]
    # @answers   = args[:answers]
  end

  def number_of_linefeeds(num)
    num.times {puts}
  end

  def print_is_user_ernest_message(user)
    puts name == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."
  end

  def when_is_user_is_75(user)
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

  def get_grandparent_status?      
    has_grandkids = gets.chomp.upcase
    has_grandkids == "Y"
  end

  def set_age_description
    if young?
      return gender == "M" ? "boy" : "girl"
    elsif old? 
      return gender == "M" ? "father" : "mother"
    end  
  end

  def ask_initial_ok?
    initial_ok = gets.chomp.upcase 
    return initial_ok == "N"
  end

  def grocery_item_guess(list)
    list.sample
  end

  def grab_item?
    return gets.chomp.chars.first.upcase == "Y"
  end

  def load_grocery_list(file)
    grocery_list = IO.read(file).split("\n")
  end

  def user_greeting_message
    puts "Hi #{ name }, who is #{ age } years old!"

    print_is_user_ernest_message(user)
    
    @answers[:description] = set_age_description

    when_is_user_is_75(user)

    puts "You are a young #{ @answers[:description] }." if young?
  end

  def ask_if_user_grandparent
    puts "Are you a great-great grand#{ @answers[:description] }?[YN]" 
    @answers[:has_grandkids?] = get_grandparent_status?              
    puts "Fantastic!!! It must be great to have grand-rugrats!!" if @answers[:has_grandkids?]
  end

  def ask_if_mind_initial
    @answers[:initial] = name.chars.first
    puts "Do you mind if I call you #{ @answer[:initial] }?[YN]"
    name = @answer[:initial] if ask_initial_ok?
  end

  def ask_where_user_going
    puts "Hey #{ name }, where are you going!?..."
    @answers[:destination] = gets.chomp
    puts "Can I come with you?" unless @answers[:destination] == "restroom"
    # user[:destination] = "home"
  end

  def user_questionaire
    ask_if_user_grandparent if old?
    ask_if_mind_initial
    ask_where_user_going
  end

  def get_user_questionaire
    user_greeting_message
    user_questionaire
  end

  def add_user_info
    user = add_user
    get_user_questionaire
    @answers[:shopping_cart] = []
    user
  end

  def add_user 
    puts "Welcome New User!!"
    user = get_user_info
    # user[:author] = false  ## change 1 - remove user[:author] from add user
    user[:grocery_list] = load_grocery_list("grocery_list.txt")
    user 
  end

  def print_user_info
    puts "Here is the author info"
    author_info = people.select {|person| person[:author]}.first
    # author_info = people.select {|person| person[:author] == "yes"}.first ## change 1 - remove user[:author] from add user

    author_info.each {|key, value| printf("%#s \t -- \t\t %s\n", key.capitalize, value)}
  end

  def remove_item_from_grocery_list(user, item)
    current_user = user.last
    current_user[:grocery_list].delete(item)    
    current_user[:shopping_cart] << item
  end

  def guess_if_item_in_cart(user) 
    current_user = user.last
    grocery_list = current_user[:grocery_list]
    grocery_list.sample
  end

  def print_grocery_list(user)
    current_user = user.last
    puts "Here is #{current_user[:grocery_list]}'s grocery list."
    current_user[:grocery_list].each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item)}
  end

  def check_user_grocery_list_items(user)
    item_guess = guess_if_item_in_cart(user)
    puts "Did you already grab the #{item_guess}?" 
    remove_item_from_grocery_list(user, item_guess) if grab_item?
    user
  end

  def print_check_grocery_list_message
      puts "Lets see if you got the items from your grocery list"
  end

  def format_update_grocery_list_to_csv_with_index(user)  #wip
    current_user = user.last
    current_user[:grocery_list].join(",")
  end

  def remember_bread(user)
    current_user = user.last
    puts "Oh yeah, don't forget the bread?" 
    current_user[:grocery_list] << "bread"
    user
  end

  def update_grocery_list_file(user)
    current_user = user.last
    new_grocery_list = format_update_grocery_list_to_csv_with_index(user)
    # IO.write("#{current_user[:name]}_new_grocery_list.txt", new_grocery_list)
    IO.write("new_grocery_list.csv", new_grocery_list)
  end



  def check_user_grocery_list(user)
    current_user = user.last
    number_of_list_items = current_user[:grocery_list].count
    print_check_grocery_list_message
    number_of_list_items.times {check_user_grocery_list_items(user)}
    user
  end

  # def introduce ###  remove this comment from top of block when done testing -- start here

  # #add__info if author_exists?(people) 

  # # number_of_linefeeds(2)

  # # people << add_user_info until people.count >= 2

  # # number_of_linefeeds(2)

  # print_author_info(people)

  # ###  remove this comment from bottom of block when done testing -- end here

  # print_grocery_list(people)
  # check_user_grocery_list(people)
  # remember_bread(people)
  # update_grocery_list_file(people)

  # puts people
  # end

   def to_s
     "name: #{name}, age: #{age}, gender: #{gender}, perferred length of spaghetti: #{spaghetti}"
   end
end