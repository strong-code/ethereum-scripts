require 'net/http'
require 'uri'
require 'json'

def report(results)
  p results
end

def run
  uri = URI.parse('https://poloniex.com/public?command=returnTicker')

  response = JSON.parse(Net::HTTP.get_response(uri).body)
  body = response['BTC_ETH']

  results = {
    :raw    => body,
    :volume => body['baseVolume'],
    :day_hi => body['high24hr'],
    :day_lo => body['low24hr']
  }

  report(results)
end

run()
