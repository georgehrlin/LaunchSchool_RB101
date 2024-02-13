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
p add_name(names, 'jim').object_id
p names
p names.object_id

=begin
# Second Article: Ruby Object's Mutating and Non-Mutating Methods
def fix(v)
  puts "initial object #{v.object_id}"
  v = v.upcase
  puts "upcased object #{v.object_id}"
  v.concat('!')
end

s = 'hello'
puts "original object #{s.object_id}"
t = fix(s)
puts "final object #{t.object_id}"

def fix(v)
  v << 'xyz'
  v = v.upcase
  v.concat('!')
end

s = 'hello'
t = fix(s)
p s
p t

def fix(v)
  v = v.upcase!
  v.concat('!')
end

s = 'hello'
p s.object_id

t = fix(s)

p s
p t
p s.object_id
p t.object_id
=end

def print_id number
  puts "In method object id = #{number.object_id}"
end

value = 33
puts "Outside method object id = #{value.object_id}"
print_id value
