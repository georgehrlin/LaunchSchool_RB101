require "pry"

require "yaml"
game_data = YAML.load_file("rps_bonus_features_refractored.yml")

ROUNDS_TO_WIN = 3
OPTIONS  = game_data["game_options"]
MESSAGES = game_data["game_messages"]

VALID_MOVES = OPTIONS.keys

def valid_abbreviations
  valid_abbreviations = []
  OPTIONS.values.each do |option|
    valid_abbreviations << option["abbreviation"]
  end
  valid_abbreviations
end

VALID_ABBREVIATIONS = valid_abbreviations

def prompt(generic_message)
  puts "=> #{generic_message}"
end

def prompt_message(message_key)
  prompt(MESSAGES[message_key])
end

def is_valid_abbreviation?(input)
  VALID_ABBREVIATIONS.include?(input)
end

def is_valid_move?(input)
  VALID_MOVES.include?(input)
end

def abbreviation_to_move(input)
  VALID_MOVES[VALID_ABBREVIATIONS.index(input)]
end

def display_moves(player_move, computer_move)
  prompt(format(MESSAGES["display_moves"],
                player_move: player_move,
                computer_move: computer_move))
end

def win?(first_move, second_move)
  OPTIONS[first_move]["beats"].include?(second_move)
end

def display_round_result(player_move, computer_move)
  if win?(player_move, computer_move)
    prompt_message("round_you_won")
  elsif win?(computer_move, player_move)
    prompt_message("round_computer_won")
  else
    prompt_message("round_tie")
  end
end

def display_grand_winner(score_to_win)
  if score_to_win == 3
    prompt_message("grand_winner_player")
  else
    prompt_message("grand_winner_computer")
  end
end

def is_valid_play_again?(input)
  (input.start_with?('y')) || (input.start_with?('n'))
end

# Game starts
prompt_message("welcome")
prompt_message("rules_moves")
prompt(format(MESSAGES["rules_rounds"], rounds_to_win: ROUNDS_TO_WIN))
prompt_message("instructions")

# Main loop
loop do
  round_number = 1
  current_score = { player_score: 0, computer_score: 0 }

  while current_score[:player_score] < ROUNDS_TO_WIN &&
        current_score[:computer_score] < ROUNDS_TO_WIN

    player_move = ""

    loop do
      prompt(format(MESSAGES["round_number"], round_number: round_number))

      valid_moves_string = VALID_MOVES.join(", ")
      prompt(format(MESSAGES["choose_move"], moves: valid_moves_string))

      player_move = gets.chomp.downcase

      if is_valid_abbreviation?(player_move)
        player_move = abbreviation_to_move(player_move)
      end

      if is_valid_move?(player_move)
        break
      else
        prompt_message("invalid_move")
      end
    end

    computer_move = VALID_MOVES.sample

    display_moves(player_move, computer_move)

    display_round_result(player_move, computer_move)

    round_number += 1

    if win?(player_move, computer_move)
      current_score[:player_score]   += 1
    elsif win?(computer_move, player_move)
      current_score[:computer_score] += 1
    end

    prompt(format(MESSAGES["current_score"],
                  player_score: current_score[:player_score],
                  computer_score: current_score[:computer_score]))
  end

  if current_score[:player_score] == ROUNDS_TO_WIN
    prompt_message("grand_winner_player")
  else
    prompt_message("grand_winner_computer")
  end

  play_again = ""
  loop do
    prompt_message("play_again?")
    play_again = gets.chomp.downcase

    unless is_valid_play_again?(play_again)
      prompt_message("play_again_invalid_input")
    else
      break
    end
  end

  break if play_again.start_with?('n')
end

prompt_message("goodbye")
