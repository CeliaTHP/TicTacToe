require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :players, :game_status, :current_player, :board
 # TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player

  def initialize
    p1 = Player.new("", "X")
    p2 = Player.new("", "O")
    @players = [p1, p2]
    @board = Board.new
    @game_status = "on going"
    @current_player = @players[0]
  end

  def init
    puts "
    -------------------------------------------------
    |              WELCOME TO THE GAME              |
    |            On va jouer au morpion             |
    |                 C'est simple :                |
    |         Aligne 3 symboles pour gagner         |  
    -------------------------------------------------"
  end

  def ask_names
    puts "Player1, tu joueras avec les 'X', choisis ton pseudo :"
    print "> "
    @players[0].name = gets.chomp
    puts ""
    puts "Player2, tu joueras avec les 'O',choisis ton pseudo :"
    print "> "
    @players[1].name = gets.chomp
  end

  def turn
    puts "C'est au tour de #{@current_player.name}, où veux-tu jouer ?"
    print "> "
    choice = gets.chomp

    every_choice = { "A1" => "0", "A2" => "1", "A3" => "2", "B1" => "3", "B2" => "4", "B3" => "5", "C1" => "6", "C2" => "7", "C3" => "8" }
    # on relie positions à l'indice de nos cases
 #MAJ ONLY ATM
    board_case_index = every_choice[choice].to_i
    selected_case = @board.board_cases_array[board_case_index]

  #on donne le bon index à chaque case, pour lire le choix du joueur
#A1 A2 A3
#B1 B2 B3
#C1 C2 C3

#boucle vérif case
while every_choice[choice].nil? || selected_case.sign != " "

      if every_choice[choice].nil? #si la case demandée n'existe pas dans every_choice, erreur 
        puts "Je ne vois pas cette case ? Es-tu sur(e) de bien écrire la case où tu veux te placer('A1'-'B2',  Maj only !) ?"

      elsif selected_case.sign != " " #si la case demandée est déjà occupée, erreur
        puts "Vous êtes trop gros pour rentrer à deux dans une même case ! "
      end

      print "> "
      choice = gets.chomp

      board_case_index = every_choice[choice].to_i
      selected_case = @board.board_cases_array[board_case_index]
    end

    selected_case.sign = @current_player.sign 
 #signe la case du joueur
    @board.count_turn += 1
    puts "Compris !"

#gère le tour par tour
#need return true pour sortir de la boucle

    if @current_player == @players[0]
      @current_player = @players[1]
return true 
    else
      @current_player = @players[0]
    end
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if @board.victory?
      # check s'il y a un gagnant avec boolean victory 
      puts "\n GG ! C'est gagné !\n \n"
      if @current_player != @players[1] # si c'est le tour de j1, c'est que j2 a win
        puts "#{@players[1].name.upcase} a juste été trop fort(e), on n'a rien pu faire !\n\n"
        puts "#{@players[0].name} veut surement sa revanche, tape 'go' pour relancer une partie!\n"
      else #sinon j1 a win
        puts "#{@players[0].name} a juste été trop fort(e), on n'a rien pu faire !\n\n"
        puts "#{@players[1].name} veut surement sa revanche, tape 'go' pour relancer une partie!\n"
      end
    else
      puts "Forcément, un loser contre un loser ça fait match nul, on relance ? Tape 'go' pour rejouer\n\n"
    end
   print " >"
again = gets.chomp.to_s
if again == "go"
load 'app.rb' #relance le programme
 end
end
end
