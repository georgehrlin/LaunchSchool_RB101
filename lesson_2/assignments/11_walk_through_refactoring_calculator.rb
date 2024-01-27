def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
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

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi! #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
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
      prompt("Must choose 1, 2, 3, or 4")
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

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")

=begin Things to Think About
1. I think a better way to validate that the user input is a number is to use
   Kernel.class(). In our case we would use the method to check whether the
   return value is Integer or Float: 
   Kernel.class() == Integer || Kernel.class() == Float
3. If we need to add some code afte the case statement within the method, to
   make sure that method still returns the strings, we can use the keyword
   return explicitly.
3. Correction: We cannot use the return keyword, because once return is reached,
   the method would exit, ignoring the lines of code that we intend to add.
   According to the official answer, the way to do it is initialize a variable,
   save the return value to the variable, then state the variable at the very
   end after the added code.
5. Although I am not entirely sure because I have not studied it, I believe
   Kernel is a module in which the class Object falls in (?). Therefore, Kernel
   is the module that encapsulates everything in Ruby. Kernel works as the
   foundation of all Ruby objects.
5. Official answer: When we write Ruby code that is not a class, we are working
   within an object called main, which is an instance of Object. The Kernel
   module is automatically loaded by Object, giving us access to all of its
   methods.
=end
