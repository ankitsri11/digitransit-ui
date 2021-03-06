Fluxible = require 'fluxible'

app = new Fluxible(
  component: require './routes.cjsx')

app.registerStore require './store/disruption-store'
app.registerStore require './store/favourite-routes-store'
app.registerStore require './store/favourite-stops-store'
app.registerStore require './store/endpoint-store'
app.registerStore require './store/itinerary-search-store'
app.registerStore require './store/location-store'
app.registerStore require './store/real-time-information-store'
app.registerStore require './store/time-store'
app.registerStore require './store/preferences-store'
app.registerStore require './store/mode-store'


module.exports = app
