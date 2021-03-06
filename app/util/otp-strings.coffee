# Convert between location objects (address, lat, lon)
# and string format OpenTripPlanner uses in many places

otpToLocation = (otpString) ->
  address: otpString.split('::')[0]
  lat: otpString.split('::')[1].split(',')[0]
  lon: otpString.split('::')[1].split(',')[1]

locationToOTP = (location) ->
  "#{location.address}::#{location.lat},#{location.lon}"

locationToCoords = (location) ->
  [location.lat, location.lon]

module.exports =
  otpToLocation: otpToLocation
  locationToOTP: locationToOTP
  locationToCoords: locationToCoords
