class Trivia
    

    @@all = []
   
    def initialize(trivia_hash) #metaprogramming
        trivia_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end

        save

    end
    
    def all_answers
        ([@correct_answer] + @incorrect_answers).shuffle
        # binding.pry
        end

    def score_all
        
        score = 0
        answers = [] <<
        score += 1
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    #this is where all the info is stored so you dont have to get the info from the api again and again
    
end
