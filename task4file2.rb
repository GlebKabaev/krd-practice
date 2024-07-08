def where(age)
  
  file=File.open("text.txt")
  file2=File.open("results.txt", "a")
  file_data=file.read.split("\n")
  File.foreach("text.txt").with_index do |val,index|
    if val.include?(age.to_s)
      File.write("results.txt",val.to_s, mode:"a")
    end
  end
end
input=1000000000000000000
while(input!=-1)
  input=gets.chomp.to_i
  where(input)
  arr=[]
  i=0
  File.foreach("text.txt").with_index do |val,index1|
    i=i+1
    arr<<false
    puts "\n"
    puts arr
    puts "\n"
    File.foreach("results.txt").with_index do |val2,index2|
      if val.include?(val2.to_s)
      arr[index1]=true
      end
    end
  end

  flag=false
  arr.each{|value|
    if value==false
      flag=true
    end
  }
  if flag=false
    input=-1
  end
end