
class CLI       #This is what you see, the display
    attr_accessor :answers, :total_questions
    attr_reader :score

    def initialize
        @score = 0
        @total_questions = 1
        call
    end

    def call
        greeting
        API.get_data
        menu
    end
    
    def greeting
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "                                                                          Welcome! Enjoy this time with your significant other and play some trivia!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
    end
  
    def menu
        puts "                                                                                      Are you ready for some trivia? Type 'y' to continue or 
                                                                                                    if you wish to exit, type 'n'                                                               "

         input = gets.chomp.downcase
                
            if  input == "y" 
                trivia_list
                menu
            elsif input == "n"
                goodbye
            else 
                invalid_entry
            end
    end

    def other_menu
        puts "                                                                                  Uh-oh, seem like you typed 'exit', do you wish to leave? (y/n)                                                       "
        
        input = gets.strip.downcase

        if input == "n"
            trivia_list
        elsif input == "y"
            puts "                                                                                                Thanks for playing some Trivia                                                                         "
            goodbye
        else 
            invalid_entry
        end

    end

    
    def trivia_list
       
        @current_questions= []
        Trivia.all.each.with_index(1) do | trivia, index|
            puts "                                    #{index}. #{trivia.question.gsub("&#039;","'").gsub("&quot;", "'").gsub("&amp;", "&").gsub("&deg;", " degrees ").gsub("&ndash;", "-")}"
            @current_questions << trivia_selection_output(trivia.question)
        end    
        twenty_questions
        input = gets.strip.to_i 
    end

    def trivia_selection_output(i)
        puts "___________________________________________________________________________________________________________________________________________________"
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        puts "___________________________________________________________________________________________________________________________________________________"
        puts "                                      Choose one of the following answers: (enter the number of answer)                                            "
        puts "---------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "                                               If you wish to Exit at anytime, type 'exit'                                                         "
        puts "___________________________________________________________________________________________________________________________________________________"

        @current_trivia = Trivia.all.find {|x| x.question == i}
        @answers = @current_trivia.all_answers.each.with_index(1) do |i, index|
            puts "#{index}. #{i.gsub("&#039;","'").gsub("&quot;", "'").gsub("&amp;", "&").gsub("&deg;", " degrees ").gsub("&ndash;", "-")}" 
        end
    
        input = gets.strip.downcase

            if input.to_i.between?(1, @answers.length)
                answer_selection(@answers[input.to_i - 1])
                score
            elsif input == "exit"
                other_menu
            else
                puts "Invalid Answer"
                trivia_selection_output(i)
            end
    
    end
       
    def answer_selection(answer)
        if answer == @current_trivia.correct_answer
           puts "#{@total_questions}"
                if @total_questions != 20
                    @score += 1
                    @total_questions += 1
                    puts "                                                                  Correct Answer - Wahoo!                                                                     "    
                else
                    twenty_questions
                end
        elsif answer == @current_trivia.incorrect_answers
            puts "                                                                          Sorry that was incorrect                                                                    "
            @total_questions += 1
        end
    end

    def score
        puts "                                                                      Your score is: #{@score}/20 "
    end

    def final_score
        puts "                                                                   Your final score is : #{@score}/20                                                                     "
    end

    def invalid_entry   
        puts "                                                                   Invalid entry, please try again.                                                                         "
        menu
    end

    def twenty_questions
        puts "You got through the game - Congrats!"
        menu
    end

    def goodbye
        puts "See you later!"
        final_score
        exit
    end
end