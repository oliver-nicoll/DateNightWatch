
class CLI       #This is what you see, the display
    
    def initialize
        call
    end

    def call
        greeting
        API.get_data
        sleep 1
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
        puts "-----------------------------------------------------------"
        puts "Choose one of the following answers: (either T/F or 1-4)"
        puts "___________________________________________________________"

       Trivia.all[i - 1].all_answers.each.with_index(1) do |i, index|
            puts "#{index}. #{i}"
        end
        
        choice = gets.strip.to_i
        #answers_arr << choice  -Where am I getting this new array from?
        answer_selection(choice)
    end
       
    def answer_selection(choice_arr)
        #needs to store your choice for each question and compare it to @correct_answer, if choice == @correct_answer, score += 1
        #else, false and it won't get added to score
    end
    def score
        puts "your score is: "
        #method that puts final score /20
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end

    def exit
        puts "Farewell - Thank you for playing!"
    end
end