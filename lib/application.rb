# LIAISON AVEC LE GAME
$:.unshift File.expand_path("../", __FILE__)
require 'game'
require 'pry'

require 'player'

class Application 

  attr_accessor :pseudo1, :pseudo2

    def initialize
        #On clean le terminal 
        system "clear"
        puts "Bienvenue dans notre jeu Joueur 1"
        puts "Veuillez renseignez votre Pseudo"
        print "> "

        #On stock le pseudo 1 dans une variable
        @pseudo1=gets.chomp

        puts "Bienvenue dans notre jeu Joueur 2"
        puts "Veuillez renseignez votre Pseudo"
        print "> "
        #On stocke le pseudo 2 dans une variable
        @pseudo2=gets.chomp

        #On instancie un nouveau jeu appelé @game, avec en attributs les pseudos récupérés
        @game = Game.new(@pseudo1, @pseudo2)

        #On clean le terminal pour lancer le jeu proprement
        system "clear"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Bienvenue #{@pseudo1} et #{@pseudo2}. Notre partie peut commencer"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
        #Petite pause de 2 seconde
        sleep 2
    end

    # Classe perform, exécuté au démarrage d'une partie
    def perform 

       #Le jeu est lancé en boucle
       while true
            system "clear"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#ON COMMENCE AVEC LE JOUEUR 1
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            puts "C'est à toi de jouer #{@pseudo1}"
            puts "Choisis ta case : "
            puts ""

            #On affiche la grille
            @game.your_turn


            #on récupère le choix de l'utilisateur
            case_choice = gets.chomp 

                #On ne conserve la réponse de l'utilisateur que si elle passe le filtre check_choice
                while true
                    if @game.check_choice(case_choice) == true
                    break
                    else
                    case_choice = gets.chomp 
                    end
                end


           # Si la résponse est correcte on remplit la case avec une croix
            @game.move_player1(case_choice)
           
            # On vérifie s'il y a un gagnant
            #Si oui on stop le jeu
            #Si non on passe au joueur suivant
            winner = @game.winner
                if winner == true then 
                    puts "Vous avez gagné #{@pseudo1}"
                break
                end

            #Si au 9 eme coup joué , il n'ya pas de gagnant, on break et on affiche Match Nul 
            if Game.game_count>=9
                puts "Match Nul"
                break
            end
               

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#ON PASSE AU JOUEUR 2
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            #On clean l'écran pour le joueur 2
            system "clear"
            puts "C'est à toi de jouer #{@pseudo2}"
            puts "Choisis ta case : "
            puts ""

            #On affiche l'échiquier
            @game.your_turn

            #On récupère la réponse de l'utilisateur 2
            case_choice = gets.chomp 

                #On ne conserve la réponse de l'utilisateur que si elle passe le filtre check_choice
                while true
                    if @game.check_choice(case_choice) == true
                    break
                    else
                    case_choice = gets.chomp 
                    end
                end
            
            # Si la résponse est correcte on remplit la case avec un rond
            @game.move_player2(case_choice)
           

            # On vérifie s'il y a un gagnant
            #Si oui on stop le jeu
            #Si non on passe au premier joueur
            winner = @game.winner
                if winner == true 
                    then puts "Vous avez gagné #{@pseudo2}"
                    break
                end
            
       end

       
        
    end



end