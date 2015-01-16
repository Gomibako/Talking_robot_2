require 'pry'


  
people = []  # replace when done testing


###  remove this block when done testing -- start here
# author = { :name=>"Martin", :age=>10, :gender=>"M", :shopping_cart=>[], :author=> "yes", :description=>"boy", :initial=>"M", :destination=>"n" }
# user   = { :name=>"Ernest", :age=>10, :gender=>"M", :shopping_cart=>[], :grocery_list => ["apples", "oranges", "peaches", "kale"], :author=> nil, :description=>"boy", :initial=>"M", :destination=>"n" }
# people = [author, user]
###  remove this block when done testing -- end here



def number_of_linefeeds(num)
  num.times {puts}
end

def print_is_user_ernest_message(user)
  puts user[:name] == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."
end


def get_user_name
	puts "What's your name?"
 	gets.chomp.capitalize
end

def get_user_age
  puts"How old are you?"
  gets.chomp.to_i
end

def get_user_gender
	puts "Are you a Male or Female?[MF]"
 	gets.chomp.upcase
end

def young?(user)
  user[:age] <= 16
end 

def old?(user)
	user[:age] >= 100
end

def when_is_user_is_75(user)
  delta = (75 - user[:age]).abs
  case user[:age]
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

def set_age_description(user)
  if young?(user)
    return user[:gender] == "M" ? "boy" : "girl"
 	elsif old?(user) 
    return user[:gender] == "M" ? "father" : "mother"
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

def get_user_info
  name   = get_user_name
  age    = get_user_age
  gender = get_user_gender 
  shopping_cart = []
  {name: name, age: age, gender: gender, shopping_cart: shopping_cart}
end

def user_greeting_message(user)
  puts "Hi #{user[:name]}, who is #{user[:age]} years old!"

  print_is_user_ernest_message(user)
  
  user[:description] = set_age_description(user)

  when_is_user_is_75(user)

  puts "You are a young #{user[:description]}." if young?(user)
end

def ask_if_user_grandparent(user) 
  puts "Are you a great-great grand#{user[:description]}?[YN]" 
  user[:has_grandkids?] = get_grandparent_status?              
  puts "Fantastic!!! It must be great to have grand-rugrats!!" if user[:has_grandkids?]
end

def ask_if_mind_initial(user)
  user[:initial] = user[:name].chars.first
  puts "Do you mind if I call you #{user[:initial]}?[YN]"
  user[:name] = user[:initial] if ask_initial_ok?
end

def ask_where_user_going(user)
  puts "Hey #{user[:name]}, where are you going!?..."
  user[:destination] = gets.chomp
  puts "Can I come with you?" unless user[:destination] == "restroom"
  # user[:destination] = "home"
end

def user_questionaire(user)
  ask_if_user_grandparent(user) if old?(user)
  ask_if_mind_initial(user)
  ask_where_user_going(user)

end

def get_user_questionaire(user)
  user_greeting_message(user)
  user_questionaire(user)
end

def add_user_info
  user = add_user
  get_user_questionaire(user)
  user
end

def add_user 
  puts "Welcome New User!!"
  user = get_user_info
  user[:author] = false
  user[:grocery_list] = load_grocery_list("grocery_list.txt")
  user 
end

def add_author_info
  author = add_author
  get_user_questionaire(author)
  author
end


def add_author
  puts "Welcome Great Creator of Content"
  author = get_user_info
  author[:author] = "yes"
  author
end

def author_exists?(people)
  people.each do |person| 
  break if person[:author] == "yes" ? true : false
  end
end

def print_author_info(people)
  puts "Here is the author info"
  author_info = people.select {|person| person[:author] == "yes"}
  author_info.each {|key, value| puts "#{key}  is #{value}"}
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

def check_user_grocery_list_items(user)
  item_guess = guess_if_item_in_cart(user)
  puts "Did you already grab the #{item_guess}?" 
  remove_item_from_grocery_list(user, item_guess) if grab_item?
end

def print_check_grocery_list_message
    puts "Lets see if you got the items from your grocery list"
end

def check_user_grocery_list(user)
  print_check_grocery_list_message
  user_grab_item = check_user_grocery_list_items(user)
  remove_item_from_grocery_list(user, user_grab_item) if user_grab_item
end

###  remove this block when done testing -- start here

people << add_author_info if author_exists?(people) 

number_of_linefeeds(2)

people << add_user_info until people.count >= 2

number_of_linefeeds(2)

print_author_info(people)

###  remove this block when done testing -- end here


check_user_grocery_list(people)




# grocery_list = load_grocery_list("grocery_list.txt")
# puts "Oh yeah, don't forget the bread?" 
# grocery_list << "bread"


# puts "Here is what is left on your grocery list:"
# grocery_list.each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item)}



