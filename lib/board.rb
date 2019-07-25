#LIAISON AVEC LE BOARDCASE
$:.unshift File.expand_path("../", __FILE__)
require 'boardcase'

class Board 

 attr_accessor :array

#On instancie les 9 cases ainsi qu'un tableau les contenant
#On donne aux neufs cases un symbole correspondant à son nom.
#Cela permet d'avoir le nom de la cellule sur l'interface graphique

def initialize

    @a1 = Boardcase.new("a1", "a1")
    @a2 = Boardcase.new("a2", "a2")
    @a3 = Boardcase.new("a3", "a3")
    @b1 = Boardcase.new("b1", "b1")
    @b2 = Boardcase.new("b2", "b2")
    @b3 = Boardcase.new("b3", "b3")
    @c1 = Boardcase.new("c1", "c1")
    @c2 = Boardcase.new("c2", "c2")
    @c3 = Boardcase.new("c3", "c3")

    @array = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
end

#Lorsque le joueur 1 joue, son symbole remplace le symbole de la case désignée
#ex : s'il écrit a1 ==> l'objet @a1 prend pour symbole x
def move_player1 (choice_case, symbole_player1)
  @array.each do |instance|
    if instance.position == choice_case
      instance.symbole = symbole_player1
    end
  end
end


#Lorsque le joueur 2 joue, son symbole remplace le symbole de la boardcase désignée
#ex : s'il écrit a1 ==> l'objet @a1 prend pour symbole o
def move_player2 (choice_case, symbole_player2)
    @array.each do |instance|
    if instance.position == choice_case
      instance.symbole = symbole_player2
    end
  end
end

#Avant de remplacer le symbole d'une Boardcase, on vérifie qu'elle existe et que son symbole est égale à sa position
#Ex : si l'utilisateur entre D8 ==> on renvoie False
#Ex : si l'utilisateur entre "a1" et que le symbole de @a1 et différent de "a1", cela signifie que la case a déjà été jouée. On renvoie False
def check_choice(choice_case)
  result = false
  @array.each do |instance|
    if instance.position == choice_case && instance.symbole == choice_case
      result = true
    end
  end
  return result
end



#Vérifie après chaque nouveau coup si un le player a une combinaison gagnante
  def winner
    if @a1.symbole == @a2.symbole && @a2.symbole == @a3.symbole && @a1.symbole != " "
      return true
     elsif @b1.symbole == @b2.symbole && @b2.symbole == @b3.symbole && @b1.symbole != " "
      return true
    elsif @c1.symbole == @c2.symbole && @c2.symbole == @c3.symbole && @c1.symbole != " "
      return true
    elsif @a1.symbole == @b1.symbole && @b1.symbole == @c1.symbole && @a1.symbole != " "
      return true
  elsif @a2.symbole == @b2.symbole && @b2.symbole == @c2.symbole && @a2.symbole != " "
      return true
    elsif @a3.symbole == @b3.symbole && @b3.symbole == @c3.symbole && @a3.symbole != " "
      return true
    elsif @a1.symbole == @b2.symbole && @b2.symbole == @c3.symbole && @a1.symbole != " "
      return true
    elsif @c1.symbole == @b2.symbole && @b2.symbole == @a3.symbole && @c1.symbole != " "
      return true
    elsif false
    end
  end


end