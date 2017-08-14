class StocksController < ApplicationController
  
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      #Recordar que esta funciona de la siguiente manera, si @stock es nil, entonces ejecutara el
      #metodo new_from_lookup, de lo contrario, solo tomara el objeto @stock
      @stock ||= Stock.new_from_lookup(params[:stock])
    end
    
    if @stock
      #render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
  

end