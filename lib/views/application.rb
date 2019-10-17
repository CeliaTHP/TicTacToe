class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    game = Game.new
    show = Show.new

    game.init
    game.ask_names
    loop do #+opti avec while ?
      while game.board.victory?.nil?  #tant que c'est pas win on clean, show et ça play
        system "clear"
        show.show_board(game.board)
        game.turn
        game.board.victory? #reask apres tour 
      end
      game.game_end
    end
  end
end
