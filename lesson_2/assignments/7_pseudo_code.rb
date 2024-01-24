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


# My atttempt program code
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


def sum(a, b)
  a + b
end


=begin A method that takes an array of strings, and returns a string that is all
those strings concatenated together
Pseudo-code:

Define a method that takes an array of strings as parameter.
  Set a variable, i, that points to integer 0 and works as iterator.
  Set a variable, result, that points to an empty string.
  Iterate through the array of strings one by one.
    - Reassign variable result by concatenating each string.

  After iterating through the array, return variable result.


Formal pseudo-code:

START

DEF method that takes an array of strings as parameter
  SET i = 0
  SET result = ""
  WHILE i < length of array of strings
    result += array[i]
    i += 1

  result

END
=end

def concatenate_strings(arr)
  i = 0
  result = ""
  while i < arr.length
    result += arr[i]
    i += 1
  end

  result
end

p concatenate_strings(["abc", "lol", "trolololol", "xDD"])


=begin A method that takes an array of integers, and returns a new array with
every other element from the original array, starting with the first element.
For instance:
every_other([1, 4, 7, 2, 5]) # => [1, 7, 5]

Pseudo-code:

Define a method, every_other, that takes one array of integers as parameter.
  Set a variable, result, that points to an empty array.
  Set a variable, i, that points to integer 0 and works as index iterator.
  Iterate through the array of integers.
    - Reassign result by appending integer at index i.
    - Reassign i by adding 2.

  After iterating through the array, return variable result.


Formal psuedo-code:

DEF every_other that takes an array of strings as parameter.
  SET result = []
  SET i = 0
  WHILE i < length of array of strings - 2
    result << integer at index i of array
    i += 2

  result

END
=end

def every_other(arr_str)
  result = []
  i = 0
  while i < arr_str.length
    result << arr_str[i]
    i += 2
  end

  result
end

p every_other([1, 4, 7, 2, 5]) # => [1, 7, 5]


=begin A method that determines the index of the 3rd occurence of a given
character in a string. For instacne, if the given character is 'x' and the
string is 'axbxcdxex', the method should return 6 (the index of the 3rd x). If
the given character does not occur at leaast 3 times, return nil.

Pseudo-code:

Define a method, third_occurence, that takes two strings as parameters--one string
is target letter, one string is string of letters.
  Set a variable, occ_counter, that points to integer 0 and works as a counter.
  Set a variable, idx_tracker, that points to integer 0 and works as an index
  tracker.
  Set a variable, i, that points to integer 0 and works as an interator.
  Iterate through string.
    - If letter equates to target letter,
      - Reassign idx_tracker to value of i.
      - Reassign occ_counter by adding 1.
        - If occ_counter equates to 3.
            - Break iteration.
    - Reassign i by adding 1.

  After iterating through string:
    - If occ_counter is at least 3,
      - Return idx_tracker
    - Otherwise,
      - Return nil.

Formal pseudo-code:

START

DEF third_occurence that takes target and str as parameters.
  occ_counter = 0
  idx_tracker = 0
  i = 0

  WHILE i < length of str
    indx_tracker = i
    occ_counter += 1 IF str[i] == target
    BREAK IF occ_counter == 3
    i += 1

  IF occ_counter >= 3
    idx_tracker
  ELSE
    nil

END
=end

def third_occurence(target, str)
  occ_counter = 0
  idx_tracker = 0
  i = 0

  while i < str.length
    if str[i] == target
      idx_tracker = i
      occ_counter += 1
    end
    break if occ_counter == 3
    i += 1
  end

  if occ_counter >= 3
    idx_tracker
  else
    nil
  end
end

p third_occurence('x', 'axbxcdxex')
p third_occurence('x', 'axbxcd')


=begin A method that takes two arrays of numbers and returns the result of
merging the arrays. The elements of the first array should become the
elements at the even indexes of the returned array, while the elements of the
second array should become the elements at the odd indexes. For instance:
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
You may assume that both array arguments have the same number of elements.

Pseudo-code:

Define a method, merge, that takes two arrays of integers as parameters.
  Set a variable, result, that points to an empty array.
  Set a variable, i, that points to integer 0 and works as an iterator.
  Iterate through first array of integers
    - Append integer at index i in first array to result.
    - Append integer at index i in second array to result.
    - Reassign i by adding 1.

  After iterating through first array, return result.


Formal pseudo-code:

START

DEF merge that takes two array of integers, arr1 and arr2, as parameters.
  SET result = []
  SET i = 0
  WHILE i < length of first array
    result << arr1[i]
    result << arr2[i]

  result

END
=end

def merge(arr1, arr2)
  result = []
  i = 0
  while i < arr1.length
    result << arr1[i]
    result << arr2[i]
    i += 1
  end

  result
end

p merge([1, 2, 3], [4, 5, 6])
