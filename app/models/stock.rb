class Stock < ActiveRecord::Base
  
  #Este metodo busca un objeto ticker en nuestra tabla de Stocks
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  #Recordar que def self.nombre_del_metodo se utiliza para nombrar metodos de clase.
  #Este metodo retorna un objeto ticker, con informacion real de stock sobre lo que le pasemos
  #como parametro.
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name
    
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
    
  def price
    #Busca si closing_price no es nil
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price
    
    #Si lo es, busca si opening_price no es nil
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price
    #Si lo es, entonces simplemente retorna unavailable
    'Unavailable'
  end
  
end
