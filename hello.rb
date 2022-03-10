def float?(input)
  input.to_f.to_s == input
end

loop do
  puts "Enter a number: "
  number = gets.chomp
  break if float?(number)
  puts "Enter a floaty number please. "
end
