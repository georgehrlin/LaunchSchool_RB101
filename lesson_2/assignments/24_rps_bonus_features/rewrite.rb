require "yaml"
game_data = YAML.load_file("rps_bonus_features_refractored.yml")

TURNS_TO_WIN = 3
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

def is_valid_abbreviation?(input)
  VALID_ABBREVIATIONS.include?(input)
end

def abbreviation_to_move(input)
  VALID_MOVES[VALID_ABBREVIATIONS.index(input)]
end

def prompt(generic_message)
  puts "=> #{generic_message}"
end

def prompt_message(message_key)
  prompt(MESSAGES[message_key])
end

def win?(first_move, second_move)
  OPTIONS[first_move]["beats"].include?(second_move)
end

def display_turn_result(player_move, computer_move)
  if win?(player_move, computer_move)
    prompt_message("round_you_won")
  elsif win?(computer_move, player_move)
    prompt_message("round_computer_won")
  else
    prompt_message("roun_tie")
  end
end

def display_current_score(player_score, computer_score)
  prompt(format(MESSAGES("current_score"),
                player_score: player_score,
                computer_score: computer_score))
end

# Game starts
prompt_message("welcome")
prompt_message("rules")
prompt_message("instructions")

# Main loop
loop do
  current_score = { player_score: 0, computer_score: 0 }

  while current_score[:player_score]   < TURNS_TO_WIN &&
        current_score[:computer_score] < TURNS_TO_WIN

    move = ""

    loop do
      valid_moves_string = VALID_MOVES.join(", ")
      prompt(format(MESSAGES("choose_move"), moves: valid_moves_string))
      move = gets.chomp
      if is_valid_abbreviation?(move)
        move = abbreviation_to_full_move(move)
      end
    end
  end
end