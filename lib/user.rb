module LatinRootsII

    class User
        attr_accessor :name

        @@all = []

        def initialize(name)
            @name = name
            @countries = []
            @@all << self
        end

        def self.all
            @@all
        end

        def passport
            puts countries.uniq
        end

        def countries=(name)
            @countries << name
        end

        def countries
            @countries
        end

    end


end