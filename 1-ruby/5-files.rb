path = '5-files.rb'
source = File.read(path)
# puts source

puts 'openning ' + path
File.open(path, 'r') do |f|
  puts f.read
end
