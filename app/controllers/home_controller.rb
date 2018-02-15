class HomeController < ApplicationController
  def index
  	@currency = nil

  	@namecur = CryptoScrap.new.get_name

  	@currency= params[:currency]

  	indice = @namecur.index(@currency).to_i
  

  	@listprice = CryptoScrap.new.get_price

  	@findprice = @listprice[indice]

  	
  end


  
end
