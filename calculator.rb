# ask user for two numbers
# ask user for operation to perform
# perform operation
# display result

Kernel.puts("Welcome to Calculator")

Kernel.puts("Enter a number: ")
number_1 = Kernel.gets().chomp()
Kernel.puts("Enter another number: ")
number_2 = Kernel.gets().chomp()

Kernel.puts("Choose an operation: 1)add  2)subtract  3)multiply  4)divide")
operator = gets().chomp()

if operator == "1"
  result = number_1.to_i() + number_2.to_i()
elsif operator == "2"
  result = number_1.to_i() - number_2.to_i()
elsif operator == "3"
  result = number_1.to_i() * number_2.to_i()
else
  result = number_1.to_f() / number_2.to_f()
end

puts("The result is #{result}")
