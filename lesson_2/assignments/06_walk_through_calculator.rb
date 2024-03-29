# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator!")

Kernel.puts ("What's the first number?")
number1 = Kernel.gets().chomp()

# Kernel.puts(number1.inspect())
# Kernel.puts("the number is : " + number1 + "!")

Kernel.puts ("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3)multiply 4) divide")
operator = Kernel.gets().chomp()

if operator =='1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}.")

# Local variables initialized within an if statement can be accessed outside of
# the if statement.

# if statements can return values in Ruby, like below:
var = if true
        "yes"
      else
        "no"
      end
Kernel.puts(var) # Output: yes
