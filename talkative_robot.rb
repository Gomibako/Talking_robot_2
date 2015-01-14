 puts "Hi what's your name?"
 name = gets.chomp
 #name = "Happy"

 puts name == "Ernest" ? "I knew it was you!" : "Sorry, you're not Ernest."

 puts "How old are you?"
 age = gets.chomp.to_i
 #age = 14

 puts "Are you a Male or Female?[MF]"
 gender =  gets.chomp.upcase!
 #gender = "M"

 puts "Hi #{name}, who is #{age} years old!"

 if age <= 16
	desc = gender == "M" ? "boy" : "girl"
	puts "You are a young #{desc}."
 elsif age >= 100
	desc = gender == "M" ? "father" : "mother"
	puts "Are you a great-great grand#{desc}?[YN]"
	q_grand = gets.chomp.upcase
#   q_grand = "Y"
	puts "You are very lucky to have some grand-rugrats." if q_grand == "Y"
 end	

 case age
 when 0..74
 	puts "You'll be 75 in #{75 - age} years."
 when 75
 	puts "You're 75!!!!"
 when 76..150
	puts "You turned 75 #{age - 75} years ago."
 end

 initial = name.chars.first.upcase
 puts "Do you mind if I call you #{initial}?[YN]"
 q_initial = gets.chomp.upcase
 name = initial unless q_initial == "Y"
 
 name.upcase!
 puts "Hey #{name}, where are you going!?..."
 going = gets.chomp
 puts "Can I come with you?" unless going == "restroom"

 puts "Hey \"Dude\", what's up?"



