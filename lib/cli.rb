
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

  

    def menu
        puts "Are you ready for some trivia? Type 'y' to continue
        or if you wish to exit, type 'n'"

         input = gets.strip.downcase
                # binding.pry
            if  input == "y"
                trivia_list
                menu
            elsif input == "n"
                exit
            else 
                invalid_entry
            end
        end
    
    def trivia_list
        Trivia.all.each.with_index(1) do | trivia, index|
            puts "#{index}. #{trivia.question}"
        end
        
        input = gets.strip.to_i
        
        trivia_selection_output(input)
    end

    def trivia_selection_output(i)
        puts "_________________________________________"
        puts "Choose one of the following answers: (either T/F or 1-4)"
        Trivia.all[i - 1].all_answers.each do |i, index|
            puts "#{index}. #{i}"
        end
        #picks_choice = gets.chomp
        



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