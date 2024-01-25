def value(n)
  puts n
  n
end

puts value(3) + value(5) * value(7)

# 3 ? 1 / 0 : 1 + 2 # raises error: ZeroDivisionError
# 5 && 1 / 0        # raises error: ZeroDivisionError
# nil || 1 / 0      # raises error: ZeroDivisionError

nil ? 1 / 0 : 1 + 2 # => 3
nil && 1 / 0        # => nil
5 || 1 / 0          # => 5

# true  ? puts "Hello" : puts "Goodbye" # raises error: SyntaxError
# false ? puts "Hello" : puts "Goodbye" # raises error: SyntaxError

# Fix:
true  ? puts("Hello") : puts("Goodbye")
false ? puts("Hello") : puts("Goodbye")

# Ideally:
puts(true  ? "Hello" : "Goodbye")
puts(false ? "Hello" : "Goodbye")

array = [1, 2, 3]

array.map { |num| + 1 }
# => [2, 3, 4]

p array.map { |num| num + 1 }
# Outputs [2, 3, 4]
# => [2, 3, 4]

array.map do |n|
  n + 1
end
# => [2, 3, 4]

p array.map do |n|
  n + 1
end
# Outputs #<Enumerator: [1, 2, 3]:map>
# => #<Enumerator: [1, 2, 3]:map>

p(array.map) do |n|
  n + 1
end

p(array.map { |num| num + 1 })
