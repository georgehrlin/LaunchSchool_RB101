# Method Definition
def greeting
  puts "Hello"
end

# Method Invocation
greeting

# A Method Call with a Block
[1, 2, 3].each { |n| puts n }

=begin
names = ['bob', 'kim']
p names
puts names.inspect
puts names
=end

def add_name(arr, name)
  arr += [name] # This does NOT mutate the object "arr" points to
  # However, if `<<` was used instead, it would've been destructive
end

names = ['bob', 'kim']
p add_name(names, 'jim')
p names
