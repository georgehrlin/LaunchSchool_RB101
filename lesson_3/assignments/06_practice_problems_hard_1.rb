# QUESTION  1 | WRONG
if true
  greeting = "hello world"
end

p greeting

=begin
I expect an undefiend variable error to occur.
Other than for, while and until loops, the if statement from line 1 to 3 creates
an inner scope that is inaccessible by the code on line 5.
=end

# CORRECTION
=begin
LMAO OMG I over-thought it and in the wrong way.
Because the first line of the if statement evaluates to false, the next line
never gets executed, so the variable greeting is never initialized. Therefore,
greeting references nil and nothing happens when greeting is called.
=end


# QUESTION 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting
puts greetings

=begin
I forgot what gets outputted when puts is given a hash.
My intial guess is:
:a => 'hi there'
=end

# CORRECTION
=begin
I got it mostly correct but didn't know that the curly braces are printed too.
Oh and there are no spaces in the output too.
The correct output is:
{:a=>'hi there'}
=end


# QUESTION 3
# A)
=begin
Code group A will print:
one is: one
two is: two
three is: three
=end

# B)
=begin
Code group B will print:
one is: one
two is: two
three is: three
=end

# C)
=begin
Code group C will print:
one is: two
two is: three
three is: one
=end


# QUESTION 4 | CORRECT, but...
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  if dot_separated_words.size == 4
    while dot_separated_words.size > 0
      word = dot_separated_words[-1]
      if (word.to_i in (0..255))
        dot_separated_words.pop
      else
        break
      end
    end
    return dot_separated_words.size == 0
  else
    return false
  end
end

p dot_separated_ip_address?("123.123.123.123") # => true
p dot_separated_ip_address?("1.2.3")           # => false
p dot_separated_ip_address?("256.1.2.3")       # => false
p dot_separated_ip_address?("1.2.3.256")       # => false

# MY NOTE
# My function works, but the official answer is way more succinct.
# I don't have the method is_an_ip_number? so to check my method I am using
# word.to_i in (0..255) instead. I know it doesn't work if word is not a number.

# OFFICIAL ANSWER
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless (word.to_i in (0..255))
  end

  true
end
