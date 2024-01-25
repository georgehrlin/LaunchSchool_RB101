p true.class
p true.nil?
p true.to_s
p true.methods

p false.class
p false.nil?
p false.to_s
p false.methods

p nil.nil?

if true
  puts 'hi'
else
  puts 'goodbye'
end
# This will always output hi

if false
  puts 'hi'
else
  puts 'goodbye'
end
# This will always output goodbye

num = 5

if (num < 10)
  puts "small number"
else
  puts "larger number"
end
# This will output: small number

puts "it's true!" if some_method_call
# This will output: it's true
# If some_method_call returns a truthy value

num = 5

if num
  puts "valid number"
else
  puts "error!"
end
# Output: valid number
# num evaluates to be truthy, but it is not equal to true:
# num == true # => false

if name = find_name
  puts "got a name"
else
  puts "couldn't find it"
end
# Output: got a name
# Not recommended. Conditional statement could easily be misunderstood to be
# an equality comparison (because it is an if statement)

name = find_name

if name && name.valid?
  puts "great name!"
else
  puts "either couldn't find name or it's invalid"
end
