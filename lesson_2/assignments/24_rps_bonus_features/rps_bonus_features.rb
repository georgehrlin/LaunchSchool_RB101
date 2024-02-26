=begin
PSEUDO-CODE
Prompt welcome message
Get user choice
  - Make sure it's among VALID_CHOICES. Otherwise, ask again
Create computer choice
Decide winner based on user choice and computer choice
Increment winning counter by 1 depending on the winner
Repeat from get user choice
Print final winner when winning counter reaches 3
Ask user if he wants to play again
=end

require "yaml"
WIN_CONDITIONS = YAML.load_file("rps_bonus_features.yml")

VALID_CHOICES = %w(rock paper scissors spock lizard)
CHOICES_ACRONYMS = %w(r p sc sp l) # Bonus Features #2

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Bonus Features #2
def acronym_to_full_word(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

=begin
def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end
=end

# Bonus Features #1
=begin
# This is my own solution for #1 without method hunting.
# I think it works:
def win?(first, second)
  i = 0
  won = false
  while i < WIN_CONDITIONS[first].length && result == false
    if WIN_CONDITIONS[first][i] == second
      won = true
      return won
    else
      i += 1
    end
  end
end
=end

# This is my second solution for #1 after method hunting:
def win?(first, second)
  # WIN_CONDITIONS[first].any? { |element| element == second}
  # Then I realized the include? method is even simpler:
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

  while player_score < 3 && computer_score < 3
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      prompt("Acronyms are allowed: r, p, sc, sp, l.")
      choice = Kernel.gets().chomp()

      # Bonus Features #2
      if CHOICES_ACRONYMS.include?(choice)
        choice = acronym_to_full_word(choice)
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
