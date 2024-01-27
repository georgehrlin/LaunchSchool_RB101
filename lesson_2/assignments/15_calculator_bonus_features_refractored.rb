require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message_key, lang=LANGUAGE)
  MESSAGES[lang][message_key]
end

def prompt(message_key)
  Kernel.puts("=> #{messages(message_key)}")
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  # Using Kernel.Integer
  Kernel.Integer(input) rescue false
  # I can also use the following, for now:
  # input.to_i.to_s == input
end

def float?(input)
  # Using Kernel.Integer
  Kernel.Float(input) rescue false
  # I can also use the following, for now:
  # input.to_f.to_s == input
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Welcome user and ask for name for greeting message
prompt("welcome")
name = ''

# Validate name is at least not empty
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("valid_name")
  else
    break
  end
end

Kernel.puts("Hi! #{name}!")

# Main loop
loop do
  # Retrieve first number
  number1 = '' # Initialize variable outside of loop for accessibility
  loop do
    prompt("first_number")
    number1 = Kernel.gets().chomp()
    # Validate number1
    if number?(number1)
      break
    else
      prompt("invalid_number")
    end
  end
  
  # Retrieve second number
  number2 = '' # Initialize variable outside of loop for accessibility
  loop do
    prompt("second_number")
    number2 = Kernel.gets().chomp()
    # Validate number1
    if number?(number2)
      break
    else
      prompt("invalid_number")
    end
  end
  
  # Using a heredoc--multi-line string--as user instruction
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  # Retrieve and verify arthmetic operation from user
  operator = ""
  loop do
    operator = Kernel.gets().chomp()

    # Using a percent string format to represent an array
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("must_choose")
    end
  end

  # Confirmation message after accpeting operation decision
  prompt("#{operation_to_message(operator)} the two numbers...")
  end
end
