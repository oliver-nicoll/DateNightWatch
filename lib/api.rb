
class  API        

    def self.get_data 
        uri = URI("https://opentdb.com/api.php?amount=20")
        response = Net::HTTP.get(uri)
        trivia_array = JSON.parse(response)["results"]
        trivia_array.each do |trivia|
            Trivia.new(trivia)
        end
    end
end