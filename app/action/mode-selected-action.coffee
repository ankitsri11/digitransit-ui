config     = require '../config'

module.exports =
  toggleBusState: (actionContext)  ->
    actionContext.dispatch "ToggleBusState",
      null,
      null

  toggleTramState: (actionContext)  ->
    actionContext.dispatch "ToggleTramState",
      null,
      null

  toggleRailState: (actionContext)  ->
    actionContext.dispatch "ToggleRailState",
      null,
      null

  toggleSubwayState: (actionContext)  ->
    actionContext.dispatch "ToggleSubwayState",
      null,
      null

  toggleFerryState: (actionContext)  ->
    actionContext.dispatch "ToggleFerryState",
      null,
      null
