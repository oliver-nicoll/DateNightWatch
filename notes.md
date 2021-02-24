-for  url

&category=#{x}&difficulty=medium&type=multiple"

category_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
            category_array << value
        end