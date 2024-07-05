def index(file_name)
  file= File.open(file_name)
  file_data=file.read
  puts file_data
end

def find(id)
  file=File.open("text.txt")
  file_data=file.read.split("\n")
  puts file_data[id]
end

def where(pattern)
  file=File.open("text.txt")
  file_data=file.read.split("\n")
  File.foreach("text.txt").with_index do |val,index|
    if val.include?(pattern)
      puts file_data[index]
    end
  end
end

def update(id,text)
  i=0
  file=File.open("text.txt",'r')
  file_data=file.read.split("\n")
  file_data[id]=text
  file.close
  File.foreach("text.txt").with_index do |val,index|
    i=i+1
  end
  file=File.open("text.txt",'w')
  i.times.with_index do |val,index|
    file.print(file_data[index]+"\n")
  end
end

def delete(id)
  i=0
  file=File.open("text.txt",'r')
  file_data=file.read.split("\n")
  file_data[id]=""
  file.close
  File.foreach("text.txt").with_index do |val,index|
    i=i+1
  end
  file=File.open("text.txt",'w')
  i.times.with_index do |val,index|
    file.print(file_data[index]+"\n")
  end
end

def create(text)
  i=0
  File.foreach("text.txt").with_index do |val,index|
    i=i+1
  end
  file=File.open("text.txt",'r')
  file_data=file.read.split("\n")
  file_data[i]=text
  i=i+1
  file.close
  puts file_data
    file=File.open("text.txt",'w')
  i.times.with_index do |val,index|
    file.print(file_data[index]+"\n")
  end
end
create("32125345")
