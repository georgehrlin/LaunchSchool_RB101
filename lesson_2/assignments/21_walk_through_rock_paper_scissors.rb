VALID_CHOICES = ['rock', 'paper', 'scissors']

def test_method
  prompt("I am the test method!")
end

# test_method # Things to consider 2

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method # Things to consider 2

# Things to consider 4

=begin
def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    # prompt("You won!") # Things to consider 3
    "You won!" # Things to consider 3
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    # prompt("You lost!") # Things to consider 3
    "You lost!" # Things to consider 3
  else
    # prompt("It's a tie!") # Things to consider 3
    "It's a tie!" # Things to consider 3
  end
end
=end

def player_won(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    "You won!"
  end
end

def player_lost(player, computer)
  if (player == 'rock' && computer == 'paper') ||
     (player == 'paper' && computer == 'scissors') ||
     (player == 'scissors' && computer == 'rock')
    "You lost!"
  end
end

def tie(player, computer)
  if player == computer
    "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt(("You chose #{choice}; computer chose #{computer_choice}."))

  # prompt(display_results(choice, computer_choice))
  if player_won(choice, computer_choice)
    prompt(player_won(choice, computer_choice))
  elsif player_lost(choice, computer_choice)
    prompt(player_lost(choice, computer_choice))
  else
    prompt(tie(choice, computer_choice))
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")

=begin
1. I think the display_results method will still work even if the prompt method
definition is moved below. I think it'll only not work if the prompt method
definition is moved below the first invocation of the display_results method.
2. Invoking test_method in the second scenario--just before the prompt method
definition--results in a NoMethodError because the method prompt is being
called from within test_method before it is defined.
3. I'd wrap display_results in prompt to display the message correctly.
4. I mitigated the Rubocop complaints by breaking display_results into three
smaller helper functions. However, to make that work I had to write some extra
lines of code so that the right game result ends up being displayed.
=end
