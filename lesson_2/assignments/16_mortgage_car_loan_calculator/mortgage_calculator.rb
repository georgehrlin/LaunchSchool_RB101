=begin
PSEUDO-CODE
Get loan amount
  - Make sure it's valid: a non-zero positive int; otherwise, ask again
  - Display loan amount to user
Get annual percentage rate (apr)
  - Make sure it's valid: a non-zero positive number (float or int) less than
    100; otherwise, ask again
  - Convert into monthly interest rate (mir)
  - Display apr to user
  - Display mir to user
Get loan duration in years
  - Make sure it's valid: a non-zero positive int; otherwise, ask again
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
LANGUAGE = "en" # "zh" for Chinese

def messages(key, language=LANGUAGE)
  MESSAGES[language][key]
end

def prompt(key)
  puts "=> #{messages(key)}"
end

def positive_int_str?(input)
  (input.to_i > 0) && (input.to_i.to_s == input)
end

def valid_apr?(apr)
  (apr.to_f > 0) && (apr.to_f < 100) &&
    ((apr.to_f.to_s == apr) || (apr.to_i.to_s == apr))
end

def get_user_name
  user_name = ""
  loop do
    prompt("get_user_name")
    user_name = gets.chomp
    if user_name.empty? || user_name == ' '
      prompt("empty_user_name")
    else
      return user_name
    end
  end
end

def get_loan_amount
  loan_amount = ""
  loop do
    prompt("get_loan_amount")
    loan_amount = gets.chomp
    if positive_int_str?(loan_amount)
      return loan_amount
    else
      prompt("invalid_loan_amount")
    end
  end
end

def get_apr
  apr = ""
  loop do
    prompt("get_annual_percentage_rate")
    apr = gets.chomp
    if valid_apr?(apr)
      return apr
    else
      prompt("invalid_annual_percentage_rate")
    end
  end
end

def apr_to_mir(apr)
  (apr.to_f / 12).round(4)
end

def mir_percent_to_decimal(mir_in_percent)
  mir_in_percent / 100
end

def get_loan_duration_year
  loan_duration_year = ""
  loop do
    prompt("get_loan_duration_year")
    loan_duration_year = gets.chomp
    if positive_int_str?(loan_duration_year)
      return loan_duration_year
    else
      prompt("invalid_loan_duration_year")
    end
  end
end

def loan_duration_year_to_month(loan_duration_year)
  loan_duration_year.to_i * 12
end

def monthly_payment(p, j, n)
  (p.to_i * (j / (1 - ((1 + j)**(-n))))).round(2)
end

# Welcome user
prompt("welcome")

# Get name from user and print greeting message with name
user_name = get_user_name
puts "=> #{format(messages('greeting'), name: user_name)}"

loop do # Main loop
  # Get loan amount from user and print it
  loan_amount = get_loan_amount
  puts "=> #{format(messages('display_loan_amount'), loan: loan_amount)}"

  # Get annual percentage rate (APR) from user and print it
  apr_in_percent = get_apr
  puts "=> #{format(messages('display_apr'), apr: apr_in_percent)}"

  # Convert annual percentage rate to monthly interest rate (MIR) and print it
  mir_in_percent = apr_to_mir(apr_in_percent)
  puts "=> #{format(messages('display_mir'), mir: mir_in_percent)}"

  # Convert MIR from percent to decimal for later calculation of monthly payment
  mir_in_decimal = mir_percent_to_decimal(mir_in_percent)

  # Get loan duration in years from user and print it
  loan_duration_year = get_loan_duration_year
  puts "=> #{format(messages('display_loan_duration_year'),
                    loan_duration_year: loan_duration_year)}"

  # Convert loan duration in years to loan duration in months and print it
  loan_duration_month = loan_duration_year_to_month(loan_duration_year)
  puts "=> #{format(messages('display_loan_duration_month'),
                    loan_duration_month: loan_duration_month)}"

  # Calculate monthly payment and print it
  monthly_payment = monthly_payment(loan_amount, mir_in_decimal,
                                    loan_duration_month)

  puts "=> #{format(messages('display_monthly_payment'),
                    loan_amount: loan_amount,
                    apr: apr_in_percent,
                    loan_duration_year: loan_duration_year,
                    monthly_payment: monthly_payment)}"

  # Ask user whether to restart another calculation. Quit if not
  prompt("restart?")
  restart = gets.chomp
  break unless restart.downcase().include?("y")
end

prompt("goodbye")

=begin
Thins to Think About
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
