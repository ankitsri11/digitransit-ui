Store = require 'fluxible/addons/BaseStore'

class EndpointStore extends Store
  # Store the user selections for the origin and destination.
  # Both can optionally be set to track the current geolocation.

  @storeName: 'EndpointStore'

  constructor: (dispatcher) ->
    super(dispatcher)
    @setOriginToCurrent()
    @clearDestination()

  clearOrigin: () ->
    @origin =
        useCurrentPosition: false
        lat: null
        lon: null
        address: null
    @emitChange()

  clearDestination: () ->
    @destination =
        useCurrentPosition: false
        lat: null
        lon: null
        address: null
    @emitChange()

  setOriginToCurrent: () ->
    @origin =
        useCurrentPosition: true
        lat: null
        lon: null
        address: null
    @emitChange()

  setDestinationToCurrent: () ->
    @destination =
        useCurrentPosition: true
        lat: null
        lon: null
        address: null
    @emitChange()

  setOrigin: (location) ->
    # Do not override useCurrentPosition
    @origin.lat = location.lat
    @origin.lon = location.lon
    @origin.address = location.address
    @emitChange()

  setDestination: (location) ->
    @destination.lat = location.lat
    @destination.lon = location.lon
    @destination.address = location.address
    @emitChange()

  getOrigin: () ->
    @origin

  getDestination: () ->
    @destination

  @handlers:
    "setOrigin": "setOrigin"
    "setDestination": "setDestination"
    "setOriginToCurrent": "setOriginToCurrent"
    "setDestinationToCurrent": "setDestinationToCurrent"
    "clearOrigin": "clearOrigin"
    "clearDestination": "clearDestination"

module.exports = EndpointStore
