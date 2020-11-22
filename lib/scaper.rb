module LatinRootsII

    class Scraper 
        attr_accessor :introduction 
       
        @@page = Nokogiri::HTML(open("https://www.britannica.com/topic/list-of-countries-in-Latin-America-2061416"))
       
        def initialize
            country_urls = @@page.css("ul.topic-list li div a[href]").collect { |link| link['href']}
            country_urls.each do |url|
                link = Nokogiri::HTML(open(url)) 
                name = link.css("h1").text.upcase.strip
                name_official = link.css("div.fact-box-details dl:contains('Official name') dd").text.gsub(/ \(.*/,"").strip
                leader = link.css("div.fact-box-details dl:contains('Head of state') dd").text.gsub(/\A.*:|\d/,"").strip
                capital = link.css("div.fact-box-details dl:contains('Capital') dd").text.gsub(/\d/,"").gsub(";"," &").strip
                language = link.css("div.fact-box-details dl:contains('Official language') dd").text.gsub(/\d/,"").strip.gsub(";"," &").strip
                currency = link.css("div.fact-box-details dl:contains('Monetary unit') dd").text.gsub(/\(.*|\d/,"").split.collect(&:capitalize).join(' ').strip
                intro = link.css("section#ref1 p").text.strip
                government = if link.css("div.fact-box-details dl:contains('Form of government')") || link.css("div.fact-box-details dl:contains('Political status')") 
                    link.css("div.fact-box-details dl:nth-of-type(2) dd").text.gsub(/\d| \(.*/,"").split.collect(&:capitalize).join(' ').strip
                end
                Country.new(link, name, name_official, leader, capital, language, currency, intro, government)
            end
        end
        
        def self.introduction 
           puts  @@page.css("section#ref1 p").text.gsub("This is an alphabetically ordered list of countries in Latin America. (See also Central America; North America; South America; West Indies (the Caribbean); Latin American art; Latin American architecture; Latin American dance; Latin American economic system; Latin American literature; Latin American music.)","")
        end

    end
end
