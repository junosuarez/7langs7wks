arr = (1..16).to_a

# print array 4 els at a time using only each
i = 0 # suuuper hacky - i just learned that enumerable.each doesn't pass an i arg
arr.each do |a|
  if i % 4 == 0
    # puts "#{arr[i]} #{arr[i+1]} #{arr[i+2]} #{arr[i+3]}"
    puts "#{arr[i..i+3]}" # i can collapse this with a range index
  end
  i = i+1
end

# now do it with enumerable.each_slice
arr.each_slice(4) do |a|
  puts "#{a}"
end

# fancy...