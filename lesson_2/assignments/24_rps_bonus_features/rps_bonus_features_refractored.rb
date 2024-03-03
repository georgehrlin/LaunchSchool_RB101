require "yaml"
game_data = YAML.load_file("rps_bonus_features_refractored.yml")

MESSAGES = game_data["messages"]
OPTIONS = game_data["options"]
VALID_MOVES = OPTIONS.keys
ROUNDS_TO_WIN = 3

def valid_abbreviations
  valid_abbreviations = []
  OPTIONS.values.each do |move|
    valid_abbreviations << move["abbreviation"]
  end
  valid_abbreviations
end

VALID_ABBREVIATIONS = valid_abbreviations

def prompt(message)
  puts("=> #{message}")
end

def valid_abbreviation?(input)
  VALID_ABBREVIATIONS.include?(input)
end

def abbreviation_to_full_move(abbreviation)
  VALID_MOVES[VALID_ABBREVIATIONS.index(abbreviation)]
end

def get_user_move(move)
  move = gets.chomp
end

def win?(first, second)
  MOVES[first]["beats"].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "You lost!"
  else
    "It's a tie!"
  end
end

def display_scores(player_score, computer_score)
  prompt("Your score: #{player_score}; computer score: #{computer_score}.")
end

prompt(MESSAGES["welcome"])
prompt(MESSAGES["rules"])
prompt(MESSAGES["instructions"])

loop do # Main loop
  current_score = { player_score: 0, computer_score: 0 }

  while current_score[:player_score] < ROUNDS_TO_WIN &&
        current_score[:computer_score] < ROUNDS_TO_WIN
    move = ''
    loop do
      prompt("Choose one: #{MOVES.keys.join(', ')}.")
      move = get_user_move

      if CHOICES_ACRONYMS.include?(choice)
        choice = CHOICES_AND_ACRONYMS[choice]
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample()

    prompt(("You chose #{choice}; computer chose #{computer_choice}."))

    prompt(display_results(choice, computer_choice))

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    display_scores(player_score, computer_score)
  end

  if player_score == 3
    prompt("You are the grand winner! Yay! :D")
  else
    prompt("Computer is the grand winner! Awww! D:")
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
