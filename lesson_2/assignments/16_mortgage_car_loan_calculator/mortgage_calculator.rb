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
MESSAGES = YAML.load_file("mortgage_car_loan_calculator_messages.yml")
LANGUAGE = "en" # zh for Chinese

def messages(key, langauge=LANGUAGE)
  MESSAGES[LANGUAGE][key]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_loan_amount?(loan_amount)
  (loan_amount.to_i > 0) && (loan_amount.to_i.to_s == loan_amount)
end

def valid_annual_percentage_rate?(apr)
  (0 < apr.to_f) && (apr.to_f < 100) && (apr.to_f.to_s == apr)
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
    if valid_loan_amount?(loan_amount)
      break
    else
      prompt(messages("invalid_loan_amount"))
    end
  end

  # Get annual percentage rate from user and validate
  annual_percentage_rate = ""
  loop do
    prompt(messages("get_annual_percentage_rate"))
    annual_percentage_rate = gets.chomp
    if valid_annual_percentage_rate?(annual_percentage_rate)
      break
    else
      prompt(message("invalid_annual_percentage_rate"))
    end
  end
  
  # Convert annual percentage rate from % to decimal
  apr_decimal = annual_percentage_rate.to_f / 100
  
  # Convert annual percentage rate to monthly interest rate and print it
  monthly_interest_rate = annual_percentage_rate.to_f / 12
  mir_decimal = apr_decimal / 12
  prompt("Your monthly intrest rate is #{monthly_interest_rate}")

  # Get loan duration in years from user and validate
  loan_duration_year = ""
  loop do
    prompt(messages("get_loan_duration_year"))
    
  end
end