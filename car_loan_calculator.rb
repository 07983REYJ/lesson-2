def prompt(message)
  puts "=> #{message}"
end

puts ("   *********************")
prompt("*CAR LOAN CALCULATOR*")
puts ("   *********************")

loan_amount = ""
loop do
  print("=> Total loan amount: $")
  loan_amount = gets.chomp
  if loan_amount.empty?() || loan_amount.to_f() <= 0
    prompt("Please enter a VALID NUMBER")
  else
    break
  end
end

apr = ""
loop do
  print "=> APR%: "
  apr = gets.chomp
  if apr.empty?() || apr.to_f() <= 0
    prompt("Please enter a VALID NUMBER")
  else
    break
  end
end

duration_prompt = <<-MSG
Choose length of terms:
  (1) 12 months
  (2) 24 months
  (3) 36 months
  (4) 48 months
  (5) 60 months
  (6) 72 months
MSG

choice = ""
loop do
  prompt(duration_prompt)
  choice = gets.chomp
  break if %w(1 2 3 4 5 6).include?(choice)
  puts "Please enter a VALID CHOICE
  
  
  
  "
end

loan_duration = case choice
  when "1"
    12
  when "2"
    24
  when "3"
    36
  when "4"
    48
  when "5"
    60
  when "6"
    72
  end

annual_interest_rate = apr.to_f() / 100
monthly_interest_rate = annual_interest_rate / 12

monthly_payment = loan_amount.to_f() * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_duration)))

monthly_payment = monthly_payment.to_f.round(2)
monthly_interest_rate = (monthly_interest_rate * 100)

puts monthly_payment
puts monthly_interest_rate
