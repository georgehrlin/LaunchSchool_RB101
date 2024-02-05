=begin PSEUDO-CODE
Get loan amount
  - Make sure it's valid: a non-zero positive number; otherwise, ask again
Get annual percentage rate
  - Make sure it's valid: a non-zero positive number smaller than 1; otherwise,
    ask again
  - Convert into monthly interest rate
Get loan duration in years
  - Make sure it's valid: a non-zero positive number; otherwise, ask again
  - Convert into loan duration in months

Display monthly interest rate
Display loan duration in months
Perform operation with loan amount, monthly interest rate, and loan duration in
months to calculate monthly payment
Display monthly payment
Ask if user wants to do another calculation
=end
require "yaml"
MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")
LANGUAGE = "en" # zh for Chinese

def messages(key, language=LANGUAGE)
  MESSAGES[language][key]
end

def prompt(message)
  puts "=> #{message}"
end

def positive_integer?(input)
  (input.to_i > 0) && (input.to_i.to_s == input)
end

def valid_annual_percentage_rate?(apr)
  (apr.to_f > 0) && (apr.to_f < 100) && (apr.to_f.to_s == apr)
end

# Welcome user and ask for name for greeting message
prompt(messages("welcome"))

user_name = gets.chomp
prompt("Hi! #{user_name}!")

# Main loop
loop do
  # Get loan amount from user and validate
  loan_amount = ""
  loop do
    prompt(messages("get_loan_amount"))
    loan_amount = gets.chomp
    if positive_integer?(loan_amount)
      break
    else
      prompt(messages("invalid_loan_amount"))
    end
  end

  # Get annual percentage rate (APR) from user and validate
  annual_percentage_rate = ""
  loop do
    prompt(messages("get_annual_percentage_rate"))
    annual_percentage_rate = gets.chomp
    if valid_annual_percentage_rate?(annual_percentage_rate)
      break
    else
      prompt(messages("invalid_annual_percentage_rate"))
    end
  end

  # Convert annual percentage rate to monthly interest rat (MIR) and print it
  monthly_interest_rate = (annual_percentage_rate.to_f / 12).round(2)
  prompt("Your monthly intrest rate is #{monthly_interest_rate}%.")

  # Calculate MIR in decimal for later calculation
  mir_decimal = annual_percentage_rate.to_f / 100 / 12

  # Get loan duration in years from user and validate
  loan_duration_year = ""
  loop do
    prompt(messages("get_loan_duration_year"))
    loan_duration_year = gets.chomp
    if positive_integer?(loan_duration_year)
      break
    else
      prompt(messages("invalid_loan_duration_year"))
    end
  end

  # Convert loan duration in years to loan duration in months and print it
  loan_duration_month = loan_duration_year.to_i * 12
  prompt("Your loan duration in months is: #{loan_duration_month} months.")

  # Calculate monthly payment and print it
  monthly_payment = (loan_amount.to_i *
                    (mir_decimal / (1 -
                    (1 + mir_decimal)**(-loan_duration_month)))).round(2)

  prompt("Based on your loan amount of: $#{loan_amount},
   annual percentage rate of: #{annual_percentage_rate}%,
   and loan duration of: #{loan_duration_year} years,
   your monthly payment is: $#{monthly_payment}.")

  prompt(messages("restart?"))
  restart = gets.chomp
  break unless restart.downcase().include?("y")
end

prompt(messages("goodbye"))

=begin Thins to Think About
1. format is a method under the Kernel module. According to assignment 11, "When
   we write Ruby code that's not in a class, we are working within an object
   called main, which is an instance of Object. The Kernel module is
   automatically loaded by Object, giving us access to all of its methods."

3. I am not so sure what is happening, but I will try:
   According to the official Ruby documentation, a format specification starts
   with a % (percent sign). The "f" is a specifier that formats the value into a
   floating-point number. The ".2" is a precision specifier that "specifies the
   number of digits after the decimal point to be written."
   Here is an explanation provided by Phind (AI):
   format is a method available in Ruby that takes a format string and one or
   more arguments, and returns a formatted string.
   '%.2f' is the format string. It tells the format method how to format the
   argument. In this case, % starts the format specification, .2 specifies the
   precision, and f indicates that the argument should be treated as a floating-
   point number.
=end
