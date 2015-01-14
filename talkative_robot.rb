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
 	return gets.chomp.upcase
 	#gender = "M"
end

def young?(age)
  return age <= 16
end 

def old?(age)
	return age >= 100
end

def when_is_user_is_75(age)
  case age
 	when 0..74
 		puts "You'll be 75 in #{75 - age} years."
 	when 75
 		puts "You're 75!!!!"
  when 76..150
		puts "You turned 75 #{age - 75} years ago."
  end
end

def get_grandparent_status?(age_description)
  puts "Are you a great-great grand#{age_description}?[YN]"
	have_grandkids = gets.chomp.upcase
  if have_grandkids == "Y"
    return true
  else
    return false
  end
end

def set_age_description(age, gender)
  if young?(age)
		age_description = gender == "M" ? "boy" : "girl"
    return age_description
 	elsif old?(age)
		age_description = gender == "M" ? "father" : "mother"
    return age_description
 	end	
end

def ask_initial_ok?(initial)
  puts "Do you mind if I call you #{initial}?[YN]"
  initial_ok = gets.chomp.upcase 
  if initial_ok == "N"
    return true
  else
    return false
  end
end

 user_name = get_user_name

 puts user_name == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."

 user_age = get_user_age 

 user_gender = get_user_gender

 puts "Hi #{user_name}, who is #{user_age} years old!"

 age_description = set_age_description(user_age, user_gender)

 puts "You are a young #{age_description}." 				           if young?(user_age)
 have_grandkids = get_grandparent_status?(age_description)	     if old?(user_age)
 puts "Fantastic!!! It must be great to have grand-rugrats!!"    if have_grandkids

 
 when_is_user_is_75(user_age)

 initial = user_name.chars.first
 user_name = initial if ask_initial_ok?(initial)
 
 puts "Hey #{user_name}, where are you going!?..."
 going = gets.chomp
 puts "Can I come with you?" unless going == "restroom"

 puts "Hey \"Dude\", what's up?"



