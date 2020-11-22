module LatinRootsII
  
    class CLI
       
        def call
            puts "Hello World, Testing" 
            LatinRootsII::Scraper.new 
            country_list
            # binding.pry
        end

        def country_list
            country_list = Country.all.collect {|i| i.name}
            puts country_list
        end
    end

end