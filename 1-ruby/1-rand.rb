x = rand(10)
guess = nil
puts x

until guess == x
  puts "guess a number between 0-9"
  guess = gets.to_i
  puts "try lower" if x < guess
  puts "try higher" if x > guess
end

puts "yep! it was #{x}"