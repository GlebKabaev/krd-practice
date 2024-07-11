class CashMachine
    def balance
        file=File.open('balance.txt')
        puts file.read
    end
    
    def init
        file=File.open('balance.txt')
        file_data=file.read.to_f
        flag=true
        new_file_data=0.0
        while flag
            puts "Enter D,W,B,Q"
            comand=gets.chomp
            case comand
                when "D"
                    puts "Enter sum like 10.0,100.0"
                    sum=gets.to_f
                    if sum>0 
                    file_data = sum + file_data
                    end
                when "W"
                    file=File.open('balance.txt')
                    puts "Enter the value > 0 and <= " + file_data.to_s
                    sum=gets.to_f
                    if sum > 0 and sum <= file_data
                        file_data = file_data-sum
                    else puts "Wrong value. Plese enter the value > 0 and <= " + file_data.to_s
                    end
                when "B"
                    puts file_data
                when "Q"
                        File.write('balance.txt',file_data)
                        break
                else
                    puts "It`s not D,W,B,Q \n Enter D,W,B,Q"
            end        
        
        
        end
    end

end

atm=CashMachine.new
atm.init