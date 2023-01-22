https://gitpod.io#snapshot/3e889bcc-e651-48f3-9e73-d24014b053c2

p "Where are you located?"

#user_location = gets.chomp

user_location = "Detroit"

p user_location

p gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"

require("open-uri")

raw_data = URI.open(gmaps_url).read

require "json"

parsed_data = JSON.parse(raw_data)

results_array = parsed_data.fetch("results")

only_result = results_array.at(0)

# only_result.keys

geo = only_result.fetch("geometry")

location = geo.fetch("location")

latitude = location.fetch("lat")
longitude = location.fetch("lng")

p latitude
p longitude
