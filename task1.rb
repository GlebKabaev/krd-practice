def gereeting
  puts "Enter your name"
  name = gets.chomp
  puts "Enter your surname"
  surname = gets.chomp
  puts "Enter your age"
  age = gets.chomp.to_i
  if age < 18
    puts "Привет,"+name + surname+". Тебе меньше 18, но начать учиться программировать никогда не рано"
  else
    puts "Привет,"+name + surname+". Самое время заняться делом!"
  end
end

def foobar(first,second)
  arr=[first,second]
  flag=false
  arr.each do |i|
    if i == 20
      flag=true
    end
  end
  if flag
    puts arr[1]
  else
    puts arr[0]+arr[1]
  end
end

foobar(1,11)
