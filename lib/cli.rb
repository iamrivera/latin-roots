module LatinRootsII
  
    class CLI
       
        def call
            puts "Hello World, Testing" 
            country_urls = LatinRootsII::Scraper.new.class.all 
            binding.pry
        end

    end

end