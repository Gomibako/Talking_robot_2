require 'pry'

class ShoppingList
  def load(list)
   IO.read(list).split("\n")
  end
  
  def print_list
     @items.each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item) }
  end

  def to_s
    @items.each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item) }
  end
end


#### example
# class GroceryList
# attr_accessor :file_name, :owner
#   def initialize(file_name, owner)
#     @file_name = file_name
#     @owner     = owner
#   end

#   def import_list(file_name)
#     IO.read(file_name).split("/n")
#   end

    # def to_s
    #   grocery_list.map.with_index do |item, index|
    #     "\n #{ index + 1 }  ---  #{ item }"
    # end.join("\n")
# end