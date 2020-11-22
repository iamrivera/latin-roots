module LatinRootsII

    class Scraper 

        def initialize
            page = Nokogiri::HTML(open("https://www.britannica.com/topic/list-of-countries-in-Latin-America-2061416"))
            country_urls = page.css("ul.topic-list li div a[href]").collect { |link| link['href']}
            country_urls.each do |url|
                link = Nokogiri::HTML(open(url)) 
                name = link.css("h1").text.upcase.strip
                Country.new(name, link)
            end
        end
        
    end


end
