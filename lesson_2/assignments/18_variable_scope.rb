# Example 1
# Outer scope variables can be accessed by inner scope
a = 1     # out scope variable

loop do   # the block following the invocation of the `loop` method creates an inner scope
  puts a  # => 1
  a += 1  # "a" is re-assigned to a new value
  break
end

puts a    # => 2
# "a" was re-assigned in the inner scope


# Example 2
# Inner scope variables cannot be accessed in outer scope
loop do # the block following the invocation of the `loop` method creates an inner scope
  b = 1
  break
end

puts b  # => NameError: undefined local variable or method `b` for main:Object
# Remember: Where a variable is initialized determines its scope


# Example 3
# Peer scopes do not conflict. They have no access to each other's scope
2.times do
  a = 'hi'
  puts a     # 'hi' <= this will be printed out twice because of the loop
end

loop do
  puts a     # NameError: undefined local variable or method `a' for main:Object
  break
end

puts a       # NameError: undefined local variable or method `a' for main:Object


# Example 4
# Nested blocks
a = 1

loop do
  b = 2

  loop do
    c = 3
    puts a # => 1
    puts b # => 2
    puts c # => 3
    break
  end

  puts a   # => 1
  puts b   # => 2
  puts c   # => NameError
  break
end

puts a     # => 1
puts b     # => NameError
puts c     # => NameError


# Example 5
# Variable shadowing
n = 10

[1, 2, 3].each do |n|
  puts n
end

n = 10

1.times do |n|
  n = 11
end

puts n # => 10

# Variables and Method Definitions
# Rule 1
# A method definition cannot access local variables in another scope
a = 'hi'

def some_method
  puts a
end

some_method # => NameError: undefined local  variable or method `a' for main:Object

# Rule 2
# A method definition can access objects passed in
def some_method
  puts a
end

some_method(5) # => 5
