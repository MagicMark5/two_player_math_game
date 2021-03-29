class Turn
  attr_accessor :players_turn
  attr_reader :question 
  
  def initialize(player)
    # If players_turn is true, it is player one's turn, if false it is players two's turn
    @players_turn = player
    @question = Question.new
  end

  def print_players_turn
    # player = self.players_turn ? 1 : 2
    puts "#{self.players_turn.name}, it's your turn: "
  end

  def ask_question
    correct_answer = @question.generate_question
    player_answer = $stdin.gets.chomp
    return correct_answer.to_s == player_answer
  end

end