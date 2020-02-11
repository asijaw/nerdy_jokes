class Jokes
    attr_accessor :title, :description, :category
    @@all = []
    
    def initialize
        @@all << self
    end 

    def self.all
        @@all
    end 

end 
 
    