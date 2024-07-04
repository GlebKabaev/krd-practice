puts "Сколько покемонов"
count=gets.chomp.to_i
names=[]
collors=[]
count.times do |val|
  puts "имя"
  names<<gets.chomp
  puts "цвет"
  collors<<gets.chomp

end
hash=[]
count.times do |val|
  hash<<{names[val]=>collors[val]}
end
puts hash
