# require 'uri'
# require 'net/http'

class  TRIVIA::API

#this is where you Get the info from the url
    def initialize
       @url_cat = "https://opentdb.com/api_category.php" #id and names x>=9 || x<+32
       @url_trivia = "https://opentdb.com/api_php?amount=20&category=#{x}&difficulty=medium&type=multiple"
        #@url = "https://opentdb.com/api.php?amount=20&category=32&difficulty=medium&type=multiple"
    end
    

    def get_trivia_data
        puts " got data once- flag!!!"
        trivia_hash = HTTParty.get(@url)
        trivia_array = trivia_hash#["results"] #returns an array of trivia questions and results hash
        self.create_object(trivia_array)
        binding.pry
    end

    def create_object(trivia_array)
        trivia_array.each do |trivia_hash|
            TRIVIA::TriviaNight.new(trivia_hash)
        end
    end


end