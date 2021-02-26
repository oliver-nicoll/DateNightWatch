
class CLI       #This is what you see, the display

    attr_reader :score

    def initialize
        @score = 0
        @total_questions = 0
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
                
            if  input == "y"
                trivia_list
                menu
            elsif input == "n"
                goodbye
            else 
                invalid_entry
            end
        end
    
    def trivia_list
        puts "Type in the number answer options are."

        Trivia.all.each.with_index(1) do | trivia, index|
            # answers(trivia)
            puts "#{index}. #{trivia.question.gsub("&#039;","'").gsub("&quot;", "'")}"
            trivia_selection_output(trivia.question)
        end

        input = gets.strip.to_i 
    
    end

    def trivia_selection_output(i)
        puts "-----------------------------------------------------------------"
        puts "Choose one of the following answers: (enter the number of answer)"
        puts "_________________________________________________________________"

        @current_trivia = Trivia.all.find {|x| x.question == i}
        answers = @current_trivia.all_answers.each.with_index(1) do |i, index|
            puts "#{index}. #{i.gsub("&#039;","'").gsub("&quot;", "'")}" 
        end

        input = gets.strip.to_i
        answer_selection(answers[input - 1])
        score
    end
       
    def answer_selection(answer)
        @total_questions += 1
        if answer == @current_trivia.correct_answer
            @score += 1
            puts "Correct Answer - Wahoo!"
        end
    end

    def score
        puts "your score is: #{@score}/20 "
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end

    def goodbye
        puts "Farewell - Thank you for playing!"
        exit
    end
end