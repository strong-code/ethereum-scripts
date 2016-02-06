require 'net/http'
require 'uri'
require 'json'

def report(results)
  p results
end

def run
  uri = URI.parse('https://api.github.com/search/repositories?q=ethereum')

  response = JSON.parse(Net::HTTP.get_response(uri).body)

  results = response['total_count']

  report(results)
end

run()
