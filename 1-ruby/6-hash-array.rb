def hash_to_array (hash = {})
  hash.map {|k,v| [k,v]}
end

puts hash_to_array({:a=>'A', :b=>'B'})

def array_to_hash (array = [])
  array.inject({}) do |hash, el|
    hash[el[0]] = el[1]
    hash
  end
end

puts array_to_hash([[1,'one'],[2,'two']])
  .to_a