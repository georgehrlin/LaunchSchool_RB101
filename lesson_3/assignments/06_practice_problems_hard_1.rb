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