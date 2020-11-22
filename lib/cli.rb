module LatinRootsII
  
    class CLI
        attr_accessor :visitor
       
        def call
            LatinRootsII::Scraper.new 
            menu            
            # binding.pry
        end

        def country_list
            country_list = Country.all.collect {|i| i.name}
            puts country_list
        end

        def menu 
            puts "Bienvenidos! Bem-Vinda! Allianchu! Welcome to Latin Roots, an interactive virtual reference guide to la vida latina!"
            puts ""
            puts "My name is Miguel and I will be your virtual tour guide. What is your name?"
            puts ""
            print "Please enter name: " 
            @visitor = gets.chomp.strip.capitalize
            puts "" 
            puts "Hello #{@visitor}! If you would like to begin with a brief intro to Latin America, please enter 'Intro Por Favor' (that's Spanish for Intro Please). Or to skip the intro and learn more about specific Latin American countries or entities, please enter 'Vamos' (that's Portuguese for Let's Go)."
            puts ""
            puts "And remember, you're una turista and you can leave anytime you want by simply saying 'Adios' (that's Spanish for Goodbye)."
            puts "" 
            print "What would you like to do?"
            @choice_one = gets.chomp.strip.downcase.delete(" ")
            case @choice_one
            when "introporfavor"
                puts "INSERT THE LATIN AMERICA INTRODUCTION"
            when "vamos"
                country_list
            when 'adios'
                puts "Goodbye! Hope to see you again!"
            else
                print "Mea Culpa (that's Latin for 'My Fault'), but I didn't quite get that. Please repeat your answer: "
                @choice_one = gets.chomp.strip.downcase.delete(" ")
            end
        end
    end

end