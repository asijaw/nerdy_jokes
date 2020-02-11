require 'pry'
class Scraper
    attr_accessor :doc

    def initialize(category)
        @doc = Nokogiri::HTML(open("http://rd.com/jokes/#{category}"))
        scrape(category)
    end

    def scrape(category)
        @doc.css(".card-wrapper").each do |post|
            joke = Jokes.new
            joke.title = post.css("h3").text
            joke.description = post.css("div.excerpt-wrapper").css("p").text
            joke.category = category
        end
    end
end
