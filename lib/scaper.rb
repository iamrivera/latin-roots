# module LatinRootsII

#     class Scraper 
#         attr_accessor :name, :name_official, :government, :leader, :capital, :language, :currency, :intro #try dynamic attr function (see learn module notes on "dynamic attr" for code syntax)

#         @@all = []

#         def initialize 
#             # source = "https://www.britannica.com/topic/list-of-countries-in-Latin-America-2061416" #Consider breaking url apart (i.e. main and slug)
#             page = Nokogiri::HTML(open("https://www.britannica.com/topic/list-of-countries-in-Latin-America-2061416"))
#             country_urls = page.css("ul.topic-list li div a[href]").collect { |link| link['href']}
#         end

#         def self.all
#             @@all
#         end
        

#     end




# end
