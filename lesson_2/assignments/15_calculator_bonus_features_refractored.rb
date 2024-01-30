require "pry"
require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en' # Chnage value to zh_s for program in simplified Chinese

def messages(message_key, lang=LANGUAGE)
  MESSAGES[lang][message_key]
end

def prompt(message)
  Kernel.puts("=> #{message}")
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
prompt(messages("welcome"))
name = ''

# Validate name is at least not empty
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages("valid_name"))
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
    prompt(messages("first_number"))
    number1 = Kernel.gets().chomp()
    # Validate number1
    if number?(number1)
      break
    else
      prompt(messages("invalid_number"))
    end
  end

  # Retrieve second number
  number2 = ''
  loop do
    prompt(messages("second_number"))
    number2 = Kernel.gets().chomp()
    # Validate number1
    if number?(number2)
      break
    else
      prompt(messages("invalid_number"))
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
      prompt(messages("must_choose"))
    end
  end

  # Confirmation message after accpeting operation decision
  prompt("#{operation_to_message(operator)} the two numbers...")

  # Methods to check for a float
  def a_float?(number1, number2)
    integer?(number1) || integer?(number2)
  end

  result = case operator
           when "1"
             if a_float?(number1, number2)
               Kernel.Float(number1) + Kernel.Float(number2)
             else
               Kernel.Integer(number1) + Kernel.Integer(number2)
             end
           when "2"
             if a_float?(number1, number2)
               Kernel.Float(number1) - Kernel.Float(number2)
             else
               Kernel.Integer(number1) - Kernel.Integer(number2)
             end
           when "3"
             if a_float?(number1, number2)
               Kernel.Float(number1) * Kernel.Float(number2)
             else
               Kernel.Integer(number1) * Kernel.Integer(number2)
             end
           when "4"
             Kernel.Float(number1) / Kernel.Float(number2)
           end

  prompt("The result is #{result}.")

  # Prompt user to do another calculation or not
  prompt(messages("another_calculation"))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().include?('y')
end

# If existing main loop, post good message and exist program
prompt(messages("goodbye"))
