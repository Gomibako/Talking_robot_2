require 'pry'
require './Person'
require './ShoppingList'

class User < Person
  def initialize(args = {})
    super
    @instance_args[:shopping_cart] = args[:shopping_cart]
  end

  def add_shopping_list(list)
    @instance_args[:grocery_list] = ShoppingList.new
    @instance_args[:grocery_list].load(list)
  end

  def get_grocery_list
    @instance_args[:grocery_list]
  end
end