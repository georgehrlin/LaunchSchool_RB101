# QUESTION 1 | WRONG
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# My prediction is that line 5, 6, and 7 will output the same number.
# WRONG

# CORRECTION
=begin
The initialization of the variable b creates a reference to a different object
with the same value that the variable a references.
=end


# QUESTION 2 | CORRECT
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

=begin
My prediction, which is a guess, is that the rules of the initiation of a
variable depend on the type of object that the variable references.
In this case, since they object is an int. I would guess once again that line
25, 26, and 27 will output the same number.
=end

# OFFICIAL ANSWER
=begin
It turns out that this has to do with how integers are immutable; that is, the
value of an integer object cannot be mutated. In Ruby, each integer is a single
immutable object (e.g., there can only be one interger 1 object, one integer 2
object, and so on). As a result, a, b, and c all reference the same immutable
integer 42 object. Any operation on an integer simply returns a new integer
object.

Note that for performance reasons, true, false, and nil are also handled
specially (e.g., every instance of true will all have the same object id). This
also has to do with the immutability of true, false, and nil.
=end


# QUESTION 3
=begin
def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"
=end

# My prediction is that line 61 will output pumpkins.
# And line 62 will output pumpkinsrutabaga.
# (Oh shoot I forgot the entirety of the sentences.)

=begin
My prediction is based on the different behaviours of += and <<.
When tricky_method is called with two arguments, what really get passed to the
method are the references to the objects that the two arguments reference.
Variables local to the method, string_param_one and string_param_two, now store
the references of string_arg_one and string_arg_two respectively, and point to
the two string objects with different IDs but the same value, "pumpkins".
Line 53 reassigns local variable string_param_one a new object with the value
"pumpkinsrutabaga" with +=. Therefore, line 61's string_arg_one still references
"pumpkins".
Line 54 mutates the string object that both the local variable string_param_two
and string_arg_two reference with <<. Therefore, line 62's string_arg_two now
references "pumpkinsrutabaga".
=end


# QUESTION 4 | CORRECT (Mostly)
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
My predction is that line 94 will output:
My string looks liks this now: pumpkinsrutabaga

And line 95 will output:
My array looks like this now: pumpkins
=end
# Mostly correct with a slight mistake: the brackets of my_array are retained
# in the output of line 95.


# QUESTION 5 | WRONG
=begin
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
=end

=begin
def tricky_method_string(a_string_param)
  a_string_param += "rutabaga"
end

def tricky_method_array(an_array_param)
  an_array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]

p my_string
p my_array

my_string = tricky_method_string(my_string)
my_array = tricky_method_array(my_array)

p my_string
p my_array
=end

# OFFICIAL ANSWER
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

my_string, my_array = not_so_tricky_method(my_string, my_array)

p my_string
p my_array

# MY NOTE
=begin
In my defense, I actually had the same line of thought to have the method return
two values and assign them accordingly to my_string and my _array. I just didn't
know that I had to and how to write the return statement inside the method
definition to return two values.
=end


# QUESTION 6 | CORRECT
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
  color == "blue" || color == "green"
end