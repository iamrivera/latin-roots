module LatinRootsII
    
    class Country
        attr_accessor :name, :name_official, :government, :leader, :capital, :language, :currency, :link, :intro #try dynamic attr function (see learn module notes on "dynamic attr" for code syntax)

        @@all = []

        def initialize(link, name, name_official, leader, capital, language, currency, intro, government)
            @name = name
            @link = link
            @name_official = name_official
            @leader = leader
            @capital = capital
            @language = language
            @currency = currency
            @intro = intro
            @government = government
            @@all << self
        end

        # def initialize(array)
        #      array.each do |url|
        #         Country.new
        #         @url = url
        #         @@all << self
        #     end
        # end

        # def self.country_detail
        #     @@all.each do |instance|
        #         page = Nokogiri::HTML(open("#{instance.link}"))
        #         @name_official = page.css("div.fact-box-details dl:contains('Official name') dd").text.gsub(/ \(.*/,"").strip
        #         @leader = page.css("div.fact-box-details dl:contains('Head of state') dd").text.gsub(/\A.*:|\d/,"").strip
        #         @capital = page.css("div.fact-box-details dl:contains('Capital') dd").text.gsub(/\d/,"").gsub(";"," &").strip
        #         @language = page.css("div.fact-box-details dl:contains('Official language') dd").text.gsub(/\d/,"").strip.gsub(";"," &").strip
        #         @currency = page.css("div.fact-box-details dl:contains('Monetary unit') dd").text.gsub(/\(.*|\d/,"").split.collect(&:capitalize).join(' ').strip
        #         # @intro = page.css("section#ref1 p").text.strip
        #         @government = if page.css("div.fact-box-details dl:contains('Form of government')") || page.css("div.fact-box-details dl:contains('Political status')") 
        #             page.css("div.fact-box-details dl:nth-of-type(2) dd").text.gsub(/\d| \(.*/,"").split.collect(&:capitalize).join(' ').strip
        #         end
        #     end
        # end

        def self.all
            @@all
        end 

        def self.find_by_name(input)
            selection = nil
            @@all.each.with_index do |country, index| 
                if index == input.to_i - 1
                    selection = country
                else
                    puts "Please re-enter selection"
                end
            end
            binding.pry
            puts "#{selection.name}"
            puts "#{selection.name_official}"
            puts "#{selection.intro}"

        end




    end



end