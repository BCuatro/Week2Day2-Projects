class Room
    attr_accessor :capacity, :occupants
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end
  def full?
    return true if occupants.length == capacity
    false
  end

  def available_space
    capacity - occupants.length
  end

  def add_occupant(name)
    return false if self.full?
    occupants << name
    true
  end

end