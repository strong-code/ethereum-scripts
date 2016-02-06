require 'net/http'
require 'uri'
require 'json'

def persist(results)
  p results
end

def log(level, data)
  puts "#{level}: #{data}"
end

def run()
  uri = URI.parse('https://etherchain.org/api/basic_stats')

  response = JSON.parse(Net::HTTP.get_response(uri).body)

  if (response['status'] != 1)
    log('ERROR', "API call to #{uri} responded with status: #{response['status']}")
    return
  end

  body = response['data']

  results = {
    :time => Time.now,
    :difficulty => {
      :number => body['difficulty']['number'],
      :difficulty => body['difficulty']['difficulty'],
      :block_time => body['difficulty']['blockTime']
    },
    :transactions => {
      :per_hour => body['txCount']['count']
    },
    :price => {
      :usd => body['price']['usd'],
      :btc => body['price']['btc']
    },
    :hash_rate => body['stats']['hashRate']
  }

  persist(results)
end

run()
