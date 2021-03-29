class Player
  attr_accessor :lives
  attr_reader :name
  
  def initialize(name)
    @lives = 3
    @name = name
  end

  def lose_life
    self.lives -= 1
  end

  def pulse_check
    puts "#{self.name} has #{self.lives}/3 lives left."
  end

end