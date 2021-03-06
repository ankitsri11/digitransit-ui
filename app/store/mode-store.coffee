Store = require 'fluxible/addons/BaseStore'

STORAGE_KEY = "mode"

class ModeStore extends Store
  @storeName: 'ModeStore'

  constructor: (dispatcher) ->
    super(dispatcher)
    localData = window?.localStorage?.getItem STORAGE_KEY
    @data = if localData then JSON.parse(localData) else
      busState: true
      tramState: true
      railState: true
      subwayState: true
      ferryState: true

  getData: ->
    @data

  getMode: ->
    mode = []
    if @getBusState() then mode.push "BUS"
    if @getTramState() then mode.push "TRAM"
    if @getRailState() then mode.push "RAIL"
    if @getSubwayState() then mode.push "SUBWAY"
    if @getFerryState() then mode.push "FERRY"
    mode.push "AIRPLANE"
    return mode

  getModeString: =>
    return @getMode.join(",")

  getBusState: ->
    @data.busState
  getTramState: ->
    @data.tramState
  getRailState: ->
    @data.railState
  getSubwayState: ->
    @data.subwayState
  getFerryState: ->
    @data.ferryState

  toggleBusState: ->
    @data.busState = !@data.busState
    @storeMode()
    @emitChange()
  toggleTramState: ->
    @data.tramState = !@data.tramState
    @storeMode()
    @emitChange()
  toggleRailState: ->
    @data.railState = !@data.railState
    @storeMode()
    @emitChange()
  toggleSubwayState: ->
    @data.subwayState = !@data.subwayState
    @storeMode()
    @emitChange()
  toggleFerryState: ->
    @data.ferryState = !@data.ferryState
    @storeMode()
    @emitChange()

  storeMode: ->
    window?.localStorage?.setItem STORAGE_KEY, JSON.stringify @data

  clearMode: ->
    @data = {}
    window?.localStorage?.removeItem STORAGE_KEY
    @emitChange()

  dehydrate: ->
    @data

  rehydrate: (data) ->
    @data = data

  @handlers:
    "ToggleBusState" : 'toggleBusState'
    "ToggleTramState" : 'toggleTramState'
    "ToggleRailState" : 'toggleRailState'
    "ToggleSubwayState" : 'toggleSubwayState'
    "ToggleFerryState" : 'toggleFerryState'

module.exports = ModeStore
