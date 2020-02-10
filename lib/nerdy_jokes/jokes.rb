class Jokes
    attr_accessor :title, :description, :category
    @@all = []
    
    def initialize
        @@all << self
    end 

    def self.all
        @@all
    end 

    # def self.find_by_category(category)
    #     list = []
    #     self.all.collect{|joke| joke.category == self.category && joke.title != ""}
    #     binding.pry
    # end
end 
 
    