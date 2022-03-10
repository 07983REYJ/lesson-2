require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(operation)
  word = case operation
    when "1"
      "Adding"
    when "2"
      "Subtracting"
    when "3"
      "Multiplying"
    when "4"
      "Dividing"
    end

  x = "A random line of code"

  word
end

prompt(MESSAGES["en"]["welcome"])

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES["en"]["valid_name"])
  else
    break
  end
end

prompt("Hello. Welcome #{name}")

loop do
  number_1 = ""

  loop do
    prompt(MESSAGES["en"]["enter_number"])
    number_1 = Kernel.gets().chomp()

    if number?(number_1)
      break
    else
      prompt(MESSAGES["en"]["invalid_number"])
    end
  end

  number_2 = ""
  loop do
    prompt(MESSAGES["en"]["enter_number2"])
    number_2 = Kernel.gets().chomp()

    if number?(number_2)
      break
    else
      prompt(MESSAGES["en"]["invalid_number"])
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
      number_1.to_f() + number_2.to_f()
    when "2"
      number_1.to_f() - number_2.to_f()
    when "3"
      number_1.to_f() * number_2.to_f()
    when "4"
      number_1.to_f() / number_2.to_f()
    end

  prompt("The result is #{result.round(2)}")

  prompt(MESSAGES["en"]["repeat"])
  choice = Kernel.gets().chomp()
  break unless choice.downcase().start_with?("y")
end

prompt(MESSAGES["en"]["goodbye"])
