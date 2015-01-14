cereals = [ "mini wheats", "cocoa crispies", "rice chex", "rolled oats", 
	       "cocoa puffs", "cream of wheat", "rice crispies", "count chocula", 
	       "Honey bunches of oats", "Special K" ]
cereals[10] = "Oatmeal"
puts cereals.first
puts cereals.last

puts cereals.index('cocoa puffs')



to_dos = [ "dishes", "squeegee cat", "walk the dog", "wax hippo", 
	       "needlepoint squid" ]

puts to_dos.first
puts to_dos.last
to_dos.index('walk the dog')

print "#{to_dos} " 
puts

to_dos.pop
print "#{to_dos} " 
puts

to_dos.shift
print "#{to_dos} " 
puts

to_dos.unshift('watch soap opera')
print "#{to_dos} " 
puts

to_dos << ('have a beer')  # this is more common usage
# to_dos.push('have a beer')
print "#{to_dos} " 
puts




[ "Squeaks", "Own", "Image", "Nootka", "Trix" }
martins_animals = {cat: "Squeaks", kitten: "Own", pony: "Image", 
	horse: "Nootka", rabbit: "Trix"}

this_room[:color] = "white"

this_class = { teachers: ["Marc", "Gerry", "Mike"], homework_complete: false, 
			   current_topic: "Hashes"}