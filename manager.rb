require "uri"
require "net/http"

class Manager
  @@repo = {}
  def initialize
    initialize_repo
  end

  def initialize_repo
    response = web_scrap
  end

  def web_scrap
    url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR"
    uri = URI(url)
    Net::HTTP.get(uri)
  end

end