require 'rubygems'
require 'nokogiri' 
require 'open-uri'


class CryptoScrap

	attr_reader :table, :table_name, :table_price

	def initialize
		@table_name = []
        @table_price = []
		@table = []
		name_price_hash = Hash.new

		url_crypto = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

		#cette boucle cible chacune des balises html <a> contenant les noms des monnaies et les rentre dans le tableau table_name
		url_crypto.css("a.currency-name-container").each do |item|  
		  @table_name << item.text #faire ce tableau est la solution que j'ai trouvée pour que les noms de monnaie soient pas collés les uns aux autres et soient exploitables
		end 
	
		#je fais le même travail que ci-dessus mais sur les prix
		url_crypto.css("a.price").each do |item|  
		  @table_price << item.text
		end 
	end

	def get_name
		@table_name
	end

    def get_price
		@table_price
	end
   
end