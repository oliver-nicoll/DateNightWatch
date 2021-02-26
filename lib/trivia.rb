class Trivia
    attr_accessor :score    

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
        end

    def score_all(score)
        score = 0
        answers = []
        if answers.include?(@correct_answer)
            score += 1
            binding.pry
        end

    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    #this is where all the info is stored so you dont have to get the info from the api again and again
    
end
