=begin A Larger Problem
Pseudo-code:

while user wants to keep going
  - ask the user for a collection of numbers
  - iterate through the collection one by one
    - save the first value as the starting value
    - for each iteration, compare the saved value with the current value
    - if the saved value is greater, or it's the same
      - move to the next value in the collection
    - otherwise, if the current value is greater
      - reassign the saved value as the current value
  
  - after iterating through the collection, save the largest value into the list.
  - ask the user if they want to input another collection

return saved list of numebrs


Formal pseudo-code:

START

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter antoher collection"
  IF "yes"
    keep_going = true
  ELSE
    keep_going = false

PRINT large_numbers

END
=end


=begin Pseudo-Code Example: Calculator
- Get the first number
  - Make sure it's valid, otherwise, ask for another
- Get the second number
  - Make sure it's valid, otherwise, ask for another
- Get the operator
  - Make sure it's valid, otherwise, ask again

- Perform operation on the two numbers
- Display result
- Ask if user wants to do another calculation
=end
