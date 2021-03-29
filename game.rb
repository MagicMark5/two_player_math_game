class Game
  @@num_of_turns = 0

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
  end

  def game_loop
    # If player_turn is true, it is player one's turn, if false it is players two's turn
    player_turn = true
    while @p1.lives > 0 && @p2.lives > 0 do
      # beginning phase of turn
      @@num_of_turns += 1
      current_player = player_turn ? @p1 : @p2
      new_turn = Turn.new(current_player)
      new_turn.print_players_turn

      # question & scoring phase of turn
      correct_answer = new_turn.ask_question
      question_response(correct_answer, current_player)


      # end phase of turn 
      puts "--------------------------"
      player_turn = !player_turn
      output_score
      if game_over
        puts "Game Over!"
        winner = @p1.lives > @p2.lives ? @p1 : @p2
        puts "#{winner.name} wins with #{winner.lives}/3 lives!"
      end
      puts "--------------------------"
    end

  end

  def output_score
    @p1.pulse_check
    @p2.pulse_check
  end

  def question_response(correct_answer, player)
    if correct_answer
      puts "Correct!"
    else 
      puts "Seriously? No!"
      player.lose_life
    end
  end

  def game_over
    @p1.lives === 0 || @p2.lives === 0
  end


end