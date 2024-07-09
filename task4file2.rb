def where(age)
  
  #file=File.open("text.txt")
  #file2=File.open("results.txt", "a")
  #file_data=file.read.split("\n")
  File.foreach("text.txt").with_index do |val,index|
    if val.include?(age.to_s)
      File.write("results.txt",val.to_s, mode:"a")
    end
  end
end
input = 0
  while input != -1
    input = gets.chomp.to_i
    break if input == -1
  
    where(input)
  
    all_written = true
    text_lines = File.readlines("text.txt").map(&:chomp)
    result_lines = File.readlines("results.txt").map(&:chomp)
  
    text_lines.each do |line|
      unless result_lines.include?(line)
        all_written = false
        break
      end
    end
  
    if all_written
      input = -1
    end
  end
  
  puts "Содержимое файла results.txt:"
  File.foreach("results.txt") { |line| puts line }