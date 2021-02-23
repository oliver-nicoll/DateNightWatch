


class TRIVIA::CLI
    #This is what you see, the display
    def run
        greeting
        TRIVIA::API.new.create_object()#.grab_date #gets data from api
        menu
    end
    
    def greeting
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " Welcome! Enjoy this time with your significant other and play some trivia!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def menu
        puts "Choose one of the following genres"
        input = gets.chomp
        
        if input == "genres"
            genre_options
        else input == "exit"
            exit
        end
    end

    def exit
        puts "Thank you for playing!"
    end

    def genre_options

    end

end