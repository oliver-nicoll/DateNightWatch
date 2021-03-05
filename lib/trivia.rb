class Trivia  

    @@all = []
   
    def initialize(trivia_hash)
        trivia_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        save
    end
    
    def all_answers
        ([correct_answer] + incorrect_answers).shuffle
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    #create a class method called find_all_medium_questions_by_category that accepts one arguemnet called category

    def self.find_all_medium_questions_by_category(category)
      array = self.all.find_all {|trivia| trivia.difficulty == "medium"  && trivia.category == category}
        array.collect {|trivia_obj| trivia_obj.question}
        array.collect(&:question)
    end

end
