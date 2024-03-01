# QUESTION 1
10.times { |i| puts " " * i + "The Flintstones Rock!"}

# OFFICIAL ANSWER
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
# I got most of the solution correct. However, I did not use a pair of
# parentheses for better clarity and I missed a final space before the closing
# brace.
# I had to look up the documentation to see how times() works exactly.


# QUESTION 2
# puts "the value of 40 + 2 is " + (40 + 2)
# This line of code results in an error because there is no implicit conversion
# of (40 + 2)'s result (an integer) into a string.
# Instead, we can do:
puts "the value of 40 + 2 is #{40 + 2}"
# Or:
puts "the value of 40 + 2 is " + (40 + 2).to_s


# QUESTION 3
def factors(number)
  divisor = number
  factors = []
  until divisor == 0
    factors << divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
# My solution would end up creating an infinite loop if a negative number was
# the input.

# BONUS 1
# The purpose is to check whether divisor is a factor of number.

# BONUS 2
# The purpose is so the function returns the factors array implicitly.

# OFFICIAL ANSWER
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
end

# MY NOTE
# The official answer's while loop solves the problem of inputs of negative
# numbers. The takeaway here is the loop condition makes a meaningful difference
# in edge cases sometimes.


# QUESTION 4
=begin
There is a major difference between the two methods, and because of it only
rolling_buffer1 will function as it is intended.
<< is destructive, and + is not. Therefore, only rolling_buffer1 can accesss the
original buffer array and change the elements by adding new_element and removing
elements with shift.
On ther other hand, because + is not destructive and method definitions have
their own confined scope, the local variable buffer within the method definition
of rolling_buffer2 has no access to the original buffer array. 
=end

=begin
Below are code I wrote to review and test the concept:

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  p buffer.object_id
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

original_buffer = [1, 2, 3, 4, 5]
p "The object ID of original_buffer before rolling_buffer2 is #{original_buffer.object_id}."
p rolling_buffer2(original_buffer, 5, 6)
p "The object ID of original_buffer after rolling_buffer2 is #{original_buffer.object_id}."
p original_buffer


def rolling_buffer3(buffer, max_buffer_size, new_element)
  buffer += [new_element]
  p buffer.object_id
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = [1, 2, 3, 4, 5]
p "The object ID of buffer before rolling_buffer3 is #{buffer.object_id}."
p rolling_buffer3(buffer, 5, 6)
p "The object ID of buffer after rolling_buffer3 is #{buffer.object_id}."
p buffer

def rolling_buffer4(buffer, max_buffer_size, new_element)
  buffer << new_element
  p buffer.object_id
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = [1, 2, 3, 4, 5]
p "The object ID of buffer before rolling_buffer4 is #{buffer.object_id}."
p rolling_buffer4(buffer, 5, 6)
p "The object ID of buffer after rolling_buffer4 is #{buffer.object_id}."
p buffer
=end


# QUESTION 5
=begin
A while loop creates its own scope, and an outer scope has no access to local
variables created inside an inner scope. Therefore, because the variable sum is
initiated inside the while loop, the calling of sum in the outer loop on line 9
would result in an error.
I would fix this issue by initiating the variable sum just before the while loop
with: sum = 0.
=end

# OFFICIAL ANSWER
=begin
Ben defines limit before he calls fib. But limit is not visible in the scope of
fib because fib is a method and does not have access to any local variables
outside of its scope.

You can make limit an additional argument to the definition of the fib method
and pass it in when you call fib.
=end

# MY NOTE
=begin
I was totally wrong. I was wrong about not only the scoping behaviour of while
loops, but also what is actually wrong about the original code in the question.
While loops (as well as until and for loops) in Ruby do not create new scopes.
The much more glaring problem, which I did not notice at all, is that the method
definition is trying to access a variable created outside of it.
=end


# QUESTION 6
# 34 is the output.


# QUESTION 7
=begin
The family's data did not get ransacked.
This is because the hash method values() returns a new array. When it is called
in the method, a new array is returned and the code following the each() method
would then their effects on this new array instead of on the original hash.
=end

# OFFICIAL ANSWER

# MY NOTE
=begin
LMAO I was so wrong.
=end


# QUESTION 8
# paper


# QUESTION 9
# Thre return value is "no".