class Show
  def show_board(board) #affichage plateau
    puts "
                 1         2         3
             _____________________________
            |         |         |         |
            |         |         |         |
         A  |    #{board.board_cases_array[0].sign}    |    #{board.board_cases_array[1].sign}    |    #{board.board_cases_array[2].sign}    |
            |         |         |         |
            |_________|_________|_________|
            |         |         |         |
            |         |         |         |
         B  |    #{board.board_cases_array[3].sign}    |    #{board.board_cases_array[4].sign}    |    #{board.board_cases_array[5].sign}    |
            |         |         |         |
            |_________|_________|_________|
            |         |         |         |
            |         |         |         |
         C  |    #{board.board_cases_array[6].sign}    |    #{board.board_cases_array[7].sign}    |    #{board.board_cases_array[8].sign}    |
            |         |         |         |
            |_________|_________|_________|"
  end
end
