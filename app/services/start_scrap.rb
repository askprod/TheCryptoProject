require 'rubygems'
require 'nokogiri'         
require 'open-uri'

class StartScrap
    attr_accessor :scrap_all

    def initialize
        @site = "https://coinmarketcap.com/all/views/all/"
        @name = 'a.currency-name-container'
        @price = 'a.price'
        @scrap_all = Hash.new
    end

    def perform
        name_array = []
        doc = Nokogiri::HTML(open(@site))
            doc = nom_monnaies = doc.css(@name).each do |keys|
            name_array << keys.text
        end

        currency_array = []
        doc = Nokogiri::HTML(open(@site))
            valeur_monnaies = doc.css(@price).each do |keys|
            currency_array << keys.text
        end
        
        no_dollars_array = currency_array.map{|v| v.tr("$", "") }
        @scrap_all = name_array.zip(no_dollars_array).to_h
  
    end

    def save
        @scrap_all.each_pair do |key, value|
            Crypto.create!(name:(key), value:(value))
        end
    end

    def update
        @scrap_all.each_pair do |key, value|
            Crypto.find(Number.last.number).update(name:(key), value:(value))
        end
    end

end





# final_hash = Hash[nom_monnaies.zip(valeur_monnaies)]

# puts final_hash