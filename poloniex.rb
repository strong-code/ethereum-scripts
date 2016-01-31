require 'net/http'
require 'uri'
require 'json'

API_URL = 'https://poloniex.com/public?command=returnTicker'

uri = URI.parse(API_URL)

response = JSON.parse(Net::HTTP.get_response(uri).body)

raw    = response['BTC_ETH']
volume = raw['baseVolume']
day_hi = raw['high24hr']
day_lo = raw['low24hr']

p raw
p day_hi
p day_lo
