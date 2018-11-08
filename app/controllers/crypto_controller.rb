class CryptoController < ApplicationController
  
  def home

  end

  def find

    update = StartScrap.new
    update.perform
    update.update

    Number.new(number: Crypto.find_by_name(params['crypto']['name']).id).save
    redirect_to '/'
  end
  # Crypto.find(rand(Crypto.count)+1)
end
