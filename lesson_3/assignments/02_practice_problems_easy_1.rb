# QUESTION 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin
I would expect the code to print out:
1
2
2
3
=end
# CORRECT


# QUESTION 2
=begin
I don't know what '?' does in Ruby haha! Let me look it up first.
OK. Hold on. I see now.
After some brief searching and without reading anything closely, I was reminded
that having a ? by the end of a method usually indicates that the method returns
a boolean value once it is executed.
On the other hand, a method that ends with ! is usually destructive, changing
the value at a certain physical memory location permanently, but not always.

1. != is a conditional operator that returns true when the value before it is
different from the value after it. I should use it in a conditional statement.

2. Putting ! before something changes its truthiness. !user_name is likely to
evaluate to false if user_name points to a string given its name.

3. Putting ! after something usually indicates that something is a destructive
method. words.uniq! permanently alters the array that words points to, leaving
only unique elements within the array.

4. (I don't know what putting ? before something means. Let me look it up.)
I totally forgot that ? is part of the ternary operator, so I suppose that, as
part of an expression that uses the ternary operator, ? comes before the two
potential outcomes of the expression. I don't know if putting ? before something
means something else.

5. Putting ? after something usually indicates that something is a method that
returns a boolean value, ture or false.

6. Putting !! before something returns the truthiness of the original something.
!!user_name evaluates to true if the truthiness of the object that user_name
points to is true.
=end
# CORRECT


# QUESTION 3
advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.split
advice[6] = 'urgent'

result = ''
advice.each do |word|
  result = result + word + ' '
end

advice = result
p advice
# LOL I know this solution is so dumb but it's my honest attempt without method hunting.
# And it works! :P

# Official Answer
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
p advice


# QUESTION 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
=begin
Without looking up documentation, my guess is delete_at(1) removes the array
element at index 1.
=end
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
=begin
My guess is delete(1) removes the array element that is 1. I will check whether
this works for multiple elements with the same value.
=end
p numbers
=begin
After checking the documentation, my guesses were correct. Also, delete() does
remove all elements of the specified value.
=end


# QUESTION 5
# 42 in 10...100 # My initial guess without looking up documentation.
# I forgot the parentheses. And there should be 2 periods for the range object
# to be inclusive.
# 42 in (10..100)

# Official Answer
puts (10..100).cover?(42)


# QUESTION 6
famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
p famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
p famous_words

famous_words = "seven years ago..."
famous_words = "Four score and #{famous_words}"
p famous_words

# Official Answer
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
p famous_words


# QUESTION 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
flintstones.flatten!
p flintstones


# QUESTION 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Attempt 1 without method hunting
array = Array.new
array.append(flintstones.flatten[4])
array.append(flintstones.flatten[5])
p array
# Attempt 2 after method hunting
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
array = flintstones.to_a[2]
p array

# Official Answer
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")
