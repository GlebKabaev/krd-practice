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
where(33)