class Player
  # TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :sign
  attr_accessor :victory_number, :name

  def initialize(name, sign)
    # TO DO : doit régler son nom et sa valeur
    @name = name
    @sign = sign
  end
end
