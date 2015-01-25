require 'pry'

class GroceryList
  attr_accessor :file, :owner
  attr_reader   :list
  def initialize(file, owner)
    @owner   =  owner
    @list    =  load_list(file)
  end

  def load_list(file)
    @list = IO.read(file).split("\n")
  end

  def print_list
     @list.each_with_index { |item, index| printf("%#2d -- %s\n", index + 1, item) }
  end

  def to_s
    item_list = @list.map.with_index do |item, index| 
      "[#{ index + 1 }]  --->  #{ item }"
    end
    item_list.join("\n")
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