module LatinRootsII
  
    class CLI
       
        def call
            puts "Hello World, Testing"
            page = Nokogiri::HTML(open("https://www.britannica.com/topic/list-of-countries-in-Latin-America-2061416"))
            page.css("ul.topic-list li div a[href]").collect { |link| link['href']}   
            binding.pry        
        end

    end

end