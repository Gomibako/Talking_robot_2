require 'pry'
require './Person'

class Author < Person
  def initialize(args = {})
    super
    @name      = "Martin"
    @age       = "42"
    @gender    = "M"
  end

end