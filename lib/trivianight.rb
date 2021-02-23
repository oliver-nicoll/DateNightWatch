class TRIVIA::TriviaNight
    
    @@all = []
   
    def initialize(trivia_hash) #metaprogramming
        trivia_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end

        @@all << self

    end

    def get_question
        self.question
    end
    
    def self.all 
        @@all
    end

    #this is where all the info is stored so you dont have to get the info from the api again and again
    
end
