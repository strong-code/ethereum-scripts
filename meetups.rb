require 'net/http'
require 'uri'
require 'yaml'
require 'json'

secrets = YAML.load_file('secrets.yml')
api_key = secrets['meetup_api_key']

uri = URI.parse("https://api.meetup.com/2/groups?key=#{api_key}&topic=ethereum")

@response = JSON.parse(Net::HTTP.get_response(uri).body)

@invalid_groups = 0
@valid_groups = {}

KEYWORDS = ['ethereum', 'blockchain']

# If it contains a keyword in the name or description fields
def is_relevant?(group)
  if KEYWORDS.any? { |k| group['description'].include?(k) }
    return true
  elsif KEYWORDS.any? { |k| group['name'].include?(k) }
    return true
  end
  false
end

def parse_response
  @response['results'].each do |group|
    if is_relevant?(group)
      @valid_groups[group['name']] = {
        :description => group['description'],
        :members => group['members']
      }
    else
      @invalid_groups += 1
    end
  end
end

parse_response()

@valid_groups.each do |k, v|
  p k
  p v[:members]
end
