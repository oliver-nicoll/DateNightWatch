
class CLI       #This is what you see, the display
    
    def initialize
        call
    end

    def call
        greeting
        API.get_data
        menu
    end
    
    def greeting
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " Welcome! Enjoy this time with your significant other and play some trivia!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
       
    end

    def trivia_list
       
 #
        input = gets.strip.downcase
            if input == "exit"
                exit
            else
            trivia_selection(trivia_array)
      
            end
    end

    def menu
        puts "Are you ready for some trivia? Type 'yes' to continue
        or if you wish to exit, type 'exit'"

         input = gets.strip.downcase
                # binding.pry
            if  input == "yes"
                trivia_list
                menu
            elsif input == "exit"
                exit
            else 
                invalid_entry
            end
        end
    
    def trivia_selection(trivia_array)
        Trivia.all.each.with_index(1) do |question, index|
            puts "#{index}. #{["question"]} "
            binding.pry
        end
    end
        #find method to find each question and go over each one

    def score
        puts "your score is: "
        #some math method here
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end

    def exit
        puts "Farewell - Thank you for playing!"
    end
end