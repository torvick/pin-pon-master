class RatedPlayer
  attr_accessor :id, :rating # ACTUALLY A SNEAKY METHOD.
  def initialize(id,rating)
    @id = id
    @rating = rating
  end
end