=begin Example
Pseudo-code:

Given a collection of intgers.

Iterate through the collection one by one.
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it's the same
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value.


Formal pseudo-code:

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END
=end

# My atttempt
def greatest_num(collection)
  i = 0
  saved = collection[i]

  while (i + 1)  < collection.length
    if saved >= collection[i + 1]
      i += 1
    else
      saved = collection[i + 1]
      i += 1
    end
  end
  
  saved
end


# Official program code
def find_greatest(numbers)
  saved_number = numbers[0]

  numbers.each do |num|
    if saved_number > num
      next
    else
      saved_number = num
    end
  end

  saved_number
end


=begin A method that returns the sum of two integers
Pseudo-code:

Define a method that takes two parameters, a and b.
  Return the result of a + b.


Formal pseudo-code:

START

DEF method that takes two parameters (a, b)
  a + b

END
=end

def sum(a + b)
  a + b
end


=begin A method that takes an array of strings, and returns a string that is all
those strings concatenated together
Pseudo-code:

Define a method that takes an array of strings as parameter.
  Set a variable, result, that points to an empty string.
  Iterate through the array of strings one by one.
    - Reassign variable result by concatenating each string.

  After iterating through the array, return variable result.


Formal pseudo-code:

START

DEF method that takes an array of strings as parameter
  result = ""
  array.each { |str| result += str }
=end
