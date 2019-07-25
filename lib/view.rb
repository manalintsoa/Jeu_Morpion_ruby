class View

	#Affiche la ditribution des symboles au début du jeu
	def initialize(player1, player2)
		puts "#{player1} a le symbole x"
	  puts "#{player2} a le symbole o"     
	end


	#Affiche la grille en puisant à chaque coup dans le tableau du Board. 
	#Permet d'afficher le symbole dynamiquement
	def your_turn(array)
		puts "|  #{array[0].symbole}  |  #{array[1].symbole}  |  #{array[2].symbole}  |"
		puts "=" * 22
		puts "|  #{array[3].symbole}  |  #{array[4].symbole}  |  #{array[5].symbole}  |"
		puts "=" * 22
		puts "|  #{array[6].symbole}  |  #{array[7].symbole}  |  #{array[8].symbole}  |"
		print ">> "
	end

	#En cas de réponse éronnés de l'utilisateur, on affiche ce message
	def check_choice
		puts "Oh oh, cette case n'est pas jouable !!"
		print "> "
	end

end