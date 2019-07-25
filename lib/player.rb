class Player
  # Un joueur est défini par son pseudo et son symbole
  attr_accessor :pseudo, :symbole

  def initialize(pseudo, symbole)
      @pseudo=pseudo
      @symbole=symbole
  end
  
end