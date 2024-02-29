# QUESTION 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages["Spot"]
p ages.any?("Spot") # This is WRONG. any? looks up the existence of an element, not a key.
p ages.include?("Spot")

# Official Answer
p ages.member?("Spot")
p ages.key?("Spot")
p ages.has_key?("Spot")


# QUESTION 2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase

munsters_description = "The Munsters are creepy in a good way."
p munsters_description[0...4] + munsters_description[4].downcase + munsters_description[5..]

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.downcase

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.upcase

# Official Answer
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!


# QUESTION 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)
# OMG LOL I guessed it right by randomly trying different verbs.

# Official Answer
ages.merge!(additional_ages)


# QUESTION 4
advice = "Few things in life are as important as house training your pet dinosaur."
# My answer after method hunting:
p advice.include?("dino")

# Official Answer
advice.match?("dino") # I am not sure why match? is used over include?.


# QUESTION 5
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)


# QUESTION 6
flintstones.append("Dino")
# Or:
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones << "Dino"

# Official Answer
# Also:
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.push("Dino")

flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.concat(["Dino"])


# QUESTION 7
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.append("Dino", "Hoppy")
p flintstones

flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.concat(["Dino", "Hoppy"])
p flintstones

# Official Answer
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.push("Dino").push("Hoppy")


# QUESTION 8
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, 39)
p advice

# Bonus
# If I used String#slice instead, advice.slice(0, 39) would still return the
# same string, but the value of advice would remain unchanged.

# Official Answer
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("ho")) # The actual answer used "house"


# QUESTION 9
statement = "The Flintstones Rock!"


# QUESTION 10
# After method hunting:
title = "Flintstone Family Members"
title.center(40)
