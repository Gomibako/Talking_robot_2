grocery_list = [ "croissant", "kale", "oranges", "wine", "pickles" ]
user = {}
user[:shopping_cart] = []

def get_user_name
	puts "Hi what's your name?"
 	return gets.chomp
end

def get_user_age
  puts "How old are you?"
 	return gets.chomp.to_i
 	#age = 14
end

def get_user_gender
	puts "Are you a Male or Female?[MF]"
 	return gets.chomp.chars.first.capitalize
 	#gender = "M"
end

def young?(user)
  return user[:age] <= 16
end 

def old?(user)
	return user[:age] >= 100
end

def print_when_is_user_is_75(user, milestone ) ### please complete case statement & set default milestone value
  milestone = 75
  age_delta = (milestone - user[:age]).abs
  case user[:age]
 	when 0..74
 		puts "You'll be 75 in #{75 - age} years."
 	when 75
 		puts "You're 75!!!!"
  when 76..150
		puts "You turned 75 #{age - 75} years ago."
  end
end

def get_grandparent_status?      
	has_grandkids = gets.chomp.chars.first.capitalize
  return has_grandkids == "Y"
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

# def grocery_item_guess(list)
#   srand
#   index = rand(list.count) - 1
#   return list[index]
# end

def grocery_item_guess(list)
    list.sample
end

def grab_item?
  return gets.chomp.chars.first.upcase == "Y"
end

user[:name] = get_user_name
#user[:name] = "Josie"

puts user[:name] == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."
  
user[:age] = get_user_age 
#user[:age] = 100

user[:gender] = get_user_gender
#user[:gender] = "M"

puts "Hi #{user[:name]}, who is #{user[:age]} years old!"

user[:description] = set_age_description(user)

puts "You are a young #{user[:description]}." if young?(user)

puts "Are you a great-great grand#{user[:description]}?[YN]" if old?(user[:age])
user[:has_grandkids?] = get_grandparent_status?              if old?(user[:age])
puts "Fantastic!!! It must be great to have grand-rugrats!!" if user[:has_grandkids?]

print_when_is_user_is_75(user)

user[:initial] = user[:name].chars.first
puts "Do you mind if I call you #{user[:initial]}?[YN]"
user[:name] = user[:initial] if ask_initial_ok?
 
puts "Hey #{user[:name]}, where are you going!?..."
user[:destination] = gets.chomp
#user[:destination] = "home"
puts "Can I come with you?" unless user[:destination] == "restroom"

puts "Hey \"Dude\", what's up?"

puts "Lets see if you got the items from your grocery list"
item_guess = grocery_item_guess(grocery_list)

puts "Did you already grab the #{item_guess}?" 
user_grab_item = grab_item?
grocery_list.delete(item_guess)    if user_grab_item
user[:shopping_cart] << item_guess if user_grab_item

puts "Oh yeah, don't forget the bread?" 
grocery_list << "bread"

print "#{grocery_list} "
puts

puts user



