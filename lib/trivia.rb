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
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end
end
