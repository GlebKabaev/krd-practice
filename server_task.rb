require "socket"
server= TCPServer.open('0.0.0.0',3001)
file=File.open('balance.txt')
file_data=file.read.to_f
flag=true
new_file_data=0.0

while connection = server.accept
    request = connection.gets
    puts request
    method, fullpath, protocol = request.split(" ")

    if fullpath.include?("?")
        path, params = fullpath.split("?")
    else
        path=fullpath
    end
    if params.include?("=")
        par, val = params.split("=")
        val=val.to_f
    else 
        val=0
    end

    puts method
    puts path
    puts params
    puts par
    puts val
    puts protocol

   


    response = case path
    when "/deposit"
        puts "Enter sum like 10.0,100.0"
        sum=val
        if sum>0 
        file_data = sum + file_data
        end
    when "/withdraw"
        file=File.open('balance.txt')
        "Enter the value > 0 and <= " + file_data.to_s
        sum=val
        if sum > 0 and sum <= file_data
            file_data = file_data-sum
        else "Wrong value. Plese enter the value > 0 and <= " + file_data.to_s
        end
    when "/balance"
        file_data
    when "/quit"
            File.write('balance.txt',file_data)
            break
    else
       "404"
    end




    status = response == "404" ? "404": "200"
    connection.print "HTTP/1.1 #{status}\r\n"
    connection.print "Content-Type: text/html\r\n"
    connection.print "\r\n"
    connection.print response

end