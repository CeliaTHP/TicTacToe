require_relative "board_case"
require_relative "game"
require_relative "player"

class Board < Game
  # TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  # Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board_cases_array, :count_turn # , :current_player

    # TO DO :
    # Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    # Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe

def initialize
    @board_cases_array = []
    (1..9).each do |i|
      @board_cases_array << BoardCase.new(i.to_s)
    end
    @count_turn = 0 #a move ???
  end


  def victory?
    # TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul

#A1 A2 A3
#B1 B2 B3
#C1 C2 C3

#combiinaisons gagnantes : 
    win = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    win.each do |x|
      if @board_cases_array[x[0]].sign != " " && @board_cases_array[x[0]].sign == @board_cases_array[x[1]].sign && @board_cases_array[x[1]].sign == @board_cases_array[x[2]].sign
 #compare  pour chaque signe  si les combinaisons actuelles impliquent une combinaison  gagnante.
        return true
      end
    end

    return false if @count_turn >= 9 #fin de la game si le board est full 
  end
end
