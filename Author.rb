require 'pry'
require './Person'

class Author < Person
  def initialize(args = {})
    super
    @instance_args[:author] = true
  end
end