def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hello. Welcome #{name}")

loop do
  number_1 = ""
  loop do
    prompt("Enter a number: ")
    number_1 = Kernel.gets().chomp()

    if integer?(number_1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number_2 = ""
  loop do
    prompt("Enter another number: ")
    number_2 = Kernel.gets().chomp()

    if integer?(number_2)
      break
    else
      prompt("Sorry, that is not a valid number.")
    end
  end

  operator_prompt =
    <<-MSG
Choose an operation:

  (1) add
  (2) subtract
  (3) multiply
  (4) divide
    MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} numbers...")

  result = case operator
    when "1"
      number_1.to_i() + number_2.to_i()
    when "2"
      number_1.to_i() - number_2.to_i()
    when "3"
      number_1.to_i() * number_2.to_i()
    when "4"
      number_1.to_i() / number_2.to_f()
    end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to use Calculator again)")
  choice = Kernel.gets().chomp()
  break unless choice.downcase().start_with?("y")
end

prompt("Thank you for using Calculator. <GOODBYE>")
