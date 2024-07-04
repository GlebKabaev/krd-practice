a=gets.chomp
cs=a[a.length-2]+a[a.length-1]
if cs == "cs" or cs=="CS" or cs=="Cs" or cs=="cS"
  puts 2**a.length
else
   puts a.reverse
end
