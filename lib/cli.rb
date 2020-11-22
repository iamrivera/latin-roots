module LatinRootsII
  
    class CLI
        attr_accessor :traveller
       
        def call #work in a persistent back feature if possible or time permits 
            LatinRootsII::Scraper.new 
            menu
            menu_two  
            # binding.pry
        end

        def country_list
            puts ""
            puts "THE COUNTRIES OF LATIN AMERICA"
            country_list = Country.all.collect.each.with_index(1) {|country, index| "#{index}. #{country.name}"}
            puts country_list
        end

        def country_explore
            country_list
            print "Please enter the number of the country you would like to learn more about:"
                input = gets.strip
                if validate_selection(input)
                input = input.to_i - 1
                country_details(input)
                else
                country_explore_error
                end
        end

        def country_explore_error
            country_list
            puts "Aye No! Your entry was invalid. Please enter a valid number (i.e. '5' or '24') from the list above:"
            input = gets.strip
            if validate_selection(input)
            input = input.to_i - 1
            country_details(input)
            else
            country_explore_error
            end
        end

        def validate_selection(input)
            input.to_i > 0
        end

        def country_details(input)
            puts ""
            @traveller.countries = Country.all[input].name.capitalize
            # binding.pry
            if Country.all[input].name_official.empty?
                puts "Welcome to #{Country.all[input].name.capitalize}!"
            else
                puts "Welcome to #{Country.all[input].name.capitalize} (#{Country.all[input].name_official})!"
            end
            puts ""
            if !Country.all[input].name_official.empty?
                puts "Here in #{Country.all[input].name.capitalize}, we speak #{Country.all[input].language}."
            end
            puts "" 
            puts "Here's a quick intro into our beloved land..." 
            puts "#{Country.all[input].intro.strip}"
            puts "" 
            puts "Would you like to learn more about #{Country.all[input].name.capitalize}?"
            selection = gets.chomp.strip.downcase.delete(" ")
            case selection
            when "yes"
                puts ""
                if !Country.all[input].leader.empty?
                    puts "Alright! Our country's leader is #{Country.all[input].leader}. Everyone has their opinion, but definitely look them up! They oversee the government, which is considered a #{Country.all[input].government}. Many people make up the government and are ultimately resposible for the national economy, which operates on our currency, the #{Country.all[input].currency}. For more information, please visit #{Country.all[input].url}"
                else
                    puts "Looks like our team on the ground has yet to report back on this country! For more information, please visit #{Country.all[input].url} "
                end
                puts ""
                print "Thanks for visiting! Would you like to visit another country? If so enter 'Vamos' OR You can now access your passport to see the countries you have virtually visited by entering 'Passport'."
                menu_two
            when "no"
                print "What would you like to do? Remember your options are 'Intro Por Favor', 'Vamos', 'Adios'....and SURPRISE! You can now access your passport to see the countries you have virtually visited by entering 'Passport'."
                     menu_two
            end
        end

        def menu 
            puts "Bienvenidos! Bem-Vinda! Allianchu! Welcome to Latin Roots, an interactive virtual reference guide to la vida latina!"
            puts ""
            puts "My name is Miguel and I will be your virtual tour guide. What is your name?"
            puts ""
            print "Please enter name: " 
            visitor = gets.chomp.strip.capitalize
            @traveller = User.new(visitor)
            puts "" 
            puts "Hello #{User.all.last.name}! If you would like to begin with a brief intro to Latin America, please enter 'Intro Por Favor' (that's Spanish for Intro Please). Or to skip the intro and learn more about specific Latin American countries or entities, please enter 'Vamos' (that's Portuguese for Let's Go)."
            puts ""
            puts "And remember, you're una turista and you can leave anytime you want by simply saying 'Adios' (that's Spanish for Goodbye)."
            puts "" 
            print "What would you like to do?"
        end

        def menu_two
            input = gets.chomp.strip.downcase.delete(" ")
                case input
                when "introporfavor"
                    puts ""
                    puts Scraper.introduction
                    puts ""
                    print "Would you like to see which countries you can explore further?" 
                    menu_two
                when "vamos"
                    country_explore 
                when "yes"
                    country_explore
                when "no"
                    puts "Too bad! I was looking forward to sharing some fun facts with you. Mi CLI es tu CLI so come on back whenever you're ready :)"
                when 'adios'
                    puts "Goodbye! Hope to see you again!"
                when 'passport'
                    puts ""
                    puts "Countries #{@traveller.name} has visited:"
                    puts @traveller.passport
                    puts "What would you like to do now?"
                    menu_two
                else
                    print "Mea Culpa (that's Latin for 'My Fault'), but I didn't quite get that. Please repeat your answer: "
                    menu_two
                end
        end
    end

end