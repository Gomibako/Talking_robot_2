require 'pry'
require './Person'

class User < Person
  def initialize(args = {})
    super
    @instance_args[:shopping_cart] = args[:shopping_cart]
  end
end