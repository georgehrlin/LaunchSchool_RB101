require "yaml"
YML = YAML.load_file("rps_bonus_features_refractored.yml")
choices = YML["choices"]
messages = YML["messages"]

p YML["choices"].fetch_values("abbreviation")

def prompt(message)
  Kernel.puts("=> #{message}")
end

def check_abbreviation?(input)
  abbreviation_is_present = false
  until abbreviation_is_present
    is_present == choices.values.each { |hash| input == hash["abbreviation"]}
  end
end

def win?(first, second)
  WIN_CONDITIONS[first].include?(second)
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

loop do # Main loop
  player_score = 0
  computer_score = 0

  while player_score < ROUNDS_TO_WIN && computer_score < ROUNDS_TO_WIN
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      prompt("Acronyms are allowed: r, p, sc, sp, l.")
      choice = Kernel.gets().chomp()

      # Bonus Features #2
      if CHOICES_ACRONYMS.include?(choice)
        # Part of my first attempt
        # choice = acronym_to_full_word(choice)
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
