module LatinRootsII

    class User
        attr_accessor :name 

        @@all = []

        def initialize(name)
            @name = name
            @countries = []
            @visits = []
            @@all << self
        end

        def self.all
            @@all
        end

        def passport
            puts countries.uniq
        end

        def visits=(name)
            @visits << name
        end

        def visits
            @visits
        end

        def countries=(name)
            @countries << name
        end

        def countries
            @countries
        end

    end


end