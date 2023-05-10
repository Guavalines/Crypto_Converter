require "uri"
require "net/http"
require "json"
require "./coin"


class Manager
  @@repo = {}
  def initialize
    initialize_repo
  end

  def initialize_repo
    response = web_scrap
    json = JSON.parse(response)
    for symbol,values in json
      coin = Coin.new(symbol, values['USD'], values['EUR'])
    end
  end

  def web_scrap
    url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR"
    uri = URI(url)
    Net::HTTP.get(uri)
  end

end
