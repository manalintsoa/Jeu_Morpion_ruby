#LIAISON AVEC LE GAME
$:.unshift File.expand_path("../", __FILE__)
require 'player'
require 'board'
require 'boardcase'
require 'view'

class Game 


    @@game_count = 0 #

    #On démarrage de la partie, on créé 2 instances de joueurs, une vue et une grille vierge
    def initialize (pseudo1, pseudo2)
        @player1=Player.new(pseudo1,"x")
        @player2=Player.new(pseudo2, "o")
        @my_view=View.new(pseudo1, pseudo2)
        @board=Board.new
    end

    #Lorsque le player 1 joue, on associe son symbole à la case chosie, dans le Board 
    def move_player1 (choice_case)
        symbole_player1 = @player1.symbole
        @board.move_player1(choice_case, symbole_player1)
        @@game_count+=1
    end

    #Lorsque le player 2 joue, on associe son symbole à la case chosie, dans le Board 
    def move_player2 (choice_case)
        symbole_player2 = @player2.symbole
        @board.move_player2(choice_case, symbole_player2) 
        @@game_count+=1
    end

    #On vérifie si le Board a une configuration gagnante (et donc un gagnant)
    def winner
        @board.winner
    end

    #On affiche la grille au travers de la view en utilisant le tableau qui contient touts les cases.
    def your_turn
        @my_view.your_turn(@board.array)
    end


    #On vérifie la validité de la réponse des joueurs dans le Board
    #Si la réponse est non conforme, on lui envoi un message depuis la view
    def check_choice(choice_case)
        if @board.check_choice(choice_case) == false
          @my_view.check_choice
          return false
        else 
          return true
        end
    end

    # Méthode de classe pour dénombrer le nombre de coups joués dans la partie
    def self.game_count
      return @@game_count
    end


end