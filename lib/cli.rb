module LatinRootsII
  
    class CLI
        attr_accessor :visitor
       
        def call #work in a persistent back feature if possible or time permits 
            LatinRootsII::Scraper.new 
            menu
            menu_two  
            # binding.pry
        end

        def country_list
            country_list = Country.all.collect {|i| i.name}
            puts country_list
        end

        def country_explore
            country_list
            print "Please enter the name of the country you would like to learn more about:  "
            input = gets.chomp.strip.downcase.delete(" ")
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
        end

        def menu_two
            input = gets.chomp.strip.downcase.delete(" ")
                case input
                when "introporfavor"
                    puts "INSERT THE LATIN AMERICA INTRODUCTION"
                    print "Would you like to see which countries you can explore further?" 
                    menu_two
                when "vamos"
                    country_list
                    country_explore 
                when "yes"
                    country_list
                    country_explore
                when "no"
                    puts "Too bad! I was looking forward to sharing some fun facts with you. Mi CLI es tu CLI so come on back whenever you're ready :)"
                when 'adios'
                    puts "Goodbye! Hope to see you again!"
                else
                    print "Mea Culpa (that's Latin for 'My Fault'), but I didn't quite get that. Please repeat your answer: "
                    menu_two
                end
        end
    end

end