require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'zh_s'

# puts MESSAGES

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key)
  Kernel.puts("=> #{message}")
end

# Assignment: Calculator Bonus Features - 1
def valid_integer?(num)
  if num == '0'
    true
  elsif num.to_i != 0
    true
  else
    false
  end
end

=begin Official Answers
def integer?(input)
  input.to_i.to_s == input
end

Using regex:
def integer?(input)
  /^-?\d+$/.match(input)
end

Using Kernel.Integer method:
def integer?(input)
  Integer(input) rescue false
end
=end

# Assignment: Calculator Bonus Features - 2
def number?(input)
  input.class == Integer || input.class == Float
end
# I don't think this answer of mine is going to work because input is a string.

=begin Official Answers
def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

Using regex:
def float?(input)
  /\d/.match(input) && /^-?\d*.?\d*$/.match(input)
end

Using Kernel.Float:
def float?(input)
  Float(input) rescue false
end
=end

# Assignment: Calculator Bonus Features - 3
def operation_to_message(op)
  case op
  when '1'
    return 'Adding'
  when '2'
    return 'Subtracting'
  when '3'
    return 'Multiplying'
  when '4'
    return 'Dividing'
  end

  x = "A random line of code"
  puts x
  puts "A line from operation_to_message"
end
# My thought process is that by making the return statements explicit we can add
# additional code to the method.

=begin Official Answer
I think my method works, but I am not sure why it is not mentioned in the
official answer. Anyway, below is the official answer:
If we wanted to add code after the case statement, we would need to save the
return value of the case into a variable, then make sure to return that
variable, or that variable must be the last line in the method.
=end

=begin Correction
I figured out that my answer is wrong. The added lines of code in the method
would not be executed because as soon as any of the return(s) is reached,
execution of the method would exit. Thanks ChatGPT!
=end

# prompt("Welcome to Calculator! Enter your name:")
# Using yaml:
prompt("welcome")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("valid_name")
  else
    break
  end
end

prompt("Hi! #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("first_number")
    number1 = Kernel.gets().chomp()

    if valid_integer?(number1)
      break
    else
      prompt("invalid_number")
    end
  end

  number2 = ''
  loop do
    prompt("second_number")
    number2 = Kernel.gets().chomp()

    if valid_integer?(number2)
      break
    else
      prompt("invalid_number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("must_choose")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt("another_calculation")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("good_bye")

=begin Things to Think About
1. I think a better way to validate that the user input is a number is to use
   Kernel.class(). In our case we would use the method to check whether the
   return value is Integer or Float.
3. If we need to add some code afte the case statement within the method, to
   make sure that method still returns the strings, we can use the keyword
   return explicitly.
5. Although I am not entirely sure because I have not studied it, I believe
   Kernel is a module in which the class Object falls in (?). Therefore, Kernel
   is the module that encapsulates everything in Ruby. Kernel works as the
   foundation of all Ruby objects.
5. Official answer: When we write Ruby code that is not a class, we are working
   within an object called main, which is an instance of Object. The Kernel
   module is automatically loaded by Object, giving us access to all of its
   methods.
=end

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
