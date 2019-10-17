class BoardCase
  attr_accessor :case_id, :sign
  # TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

  def initialize(case_id, sign = " ")
    # TO DO : doit régler sa valeur, ainsi que son numéro de case
    @case_id = case_id
    @sign = sign
  end
end
