require 'pry'
class NerdyJokes::CLI

    def call
        puts "Welcome!"
        puts "To see the categories of nerdy jokes, enter 'jokes'"
        puts "To exit, enter 'exit'"

        Scraper.new("math")
        Scraper.new("science-jokes")
        Scraper.new("computer")
        Scraper.new("dad")
        menu

    end 

    def menu
        input = gets.strip.downcase

        if input == "jokes"
            jokes_list
        elsif input == "exit"
            puts "See ya, stay nerdy!"
        else
            puts "Invalid entry, try again"
            menu
        end
    end 

    def jokes_list
        puts ""
        puts "1. Math"
        puts "2. Science"
        puts "3. Computer"
        puts "4. Dad Jokes"
        puts "Please choose a category"

        input = gets.strip.downcase
        category_selection(input)
    end 

    def category_selection(input)
        if input == "math" || input == "1"
            list_titles("math")
        elsif input == "science" || input == "2"
            list_titles("science-jokes")
        elsif input == "computer" || input == "3"
            list_titles("computer") 
        elsif input == "dad jokes" || input == "4"
            list_titles("dad") 
        else
            puts "Invalid entry, try again"
            jokes_list
        end

        puts "For a new joke, enter 'jokes'"
        puts "Or to exit, enter 'exit'"
        entry = gets.strip.downcase
        after_joke(entry)
    end

    def list_titles(category)
        puts ""
        i = 1    
        Jokes.all.each{|joke| 
            if category == joke.category && joke.title != "" && i <= 10
                puts "#{i}. #{joke.title}" 
                i+=1
            end 
        }
        
        puts "Please enter the number of a joke title to view the joke"
        entry = gets.strip
        print_joke(category, entry)
    end

    def after_joke(input)
        if input == "jokes"
            jokes_list
        elsif input == "exit"
            puts "See ya, stay nerdy!"
        else
            puts "Invalid entry, try again" 
            puts "For a new joke, enter 'jokes'"
            puts "Or to exit, enter 'exit'"
            entry = gets.strip.downcase
            after_joke(entry)
        end
    end

    def print_joke(category, num)
        if num.to_i > 0
            puts ""
            i = 1
            Jokes.all.each {|joke| 
                if category == joke.category && joke.title != ""
                    puts "#{joke.title}\n#{joke.description}" if i == (num.to_i)
                    i += 1
                end
            }
        end 
    end 
end
 