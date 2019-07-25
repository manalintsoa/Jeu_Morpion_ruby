#LIAISON AVEC LE BOARD
$:.unshift File.expand_path("../", __FILE__)
require 'board'

class Boardcase

  attr_accessor :position, :symbole

  #Une case a une position et un symbole 
    def initialize(position, symbole)
      @position = position
      @symbole = symbole
    end
end