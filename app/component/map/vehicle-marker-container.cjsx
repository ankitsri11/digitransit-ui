React         = require 'react'
ReactDOM      = require 'react-dom/server'
Relay         = require 'react-relay'
queries       = require '../../queries'
isBrowser     = window?
DynamicPopup  = if isBrowser then require './dynamic-popup' else null
RouteMarkerPopup = require './route-marker-popup'
Marker        = if isBrowser then require 'react-leaflet/lib/Marker' else null
L             = if isBrowser then require 'leaflet' else null
RealTimeInformationAction = require '../../action/real-time-client-action'
Icon          = require '../icon/icon'

popupOptions =
  offset: [106, 3]
  closeButton:false
  maxWidth:250
  minWidth:250
  className:"popup"

class VehicleMarkerContainer extends React.Component
  @contextTypes:
    getStore: React.PropTypes.func.isRequired
    executeAction: React.PropTypes.func.isRequired
    history: React.PropTypes.object.isRequired

  @vehicleIcons: if !isBrowser then null else
    bus: L.divIcon(html: ReactDOM.renderToStaticMarkup(React.createElement(Icon, img: 'icon-icon_bus-live')), className: 'vehicle-icon bus', iconSize: [20, 20], iconAnchor: [10, 10])
    tram: L.divIcon(html: ReactDOM.renderToStaticMarkup(React.createElement(Icon, img: 'icon-icon_tram-live')), className: 'vehicle-icon tram', iconSize: [20, 20], iconAnchor: [10, 10])
    rail: L.divIcon(html: ReactDOM.renderToStaticMarkup(React.createElement(Icon, img: 'icon-icon_rail-live')), className: 'vehicle-icon rail', iconSize: [20, 20], iconAnchor: [10, 10])
    subway: L.divIcon(html: ReactDOM.renderToStaticMarkup(React.createElement(Icon, img: 'icon-icon_subway-live')), className: 'vehicle-icon subway', iconSize: [20, 20], iconAnchor: [10, 10])
    ferry: L.divIcon(html: ReactDOM.renderToStaticMarkup(React.createElement(Icon, img: 'icon-icon_ferry-live')), className: 'vehicle-icon ferry', iconSize: [20, 20], iconAnchor: [10, 10])

  constructor: () ->
    @vehicles = {}

  componentWillMount: ->
    if @props.startRealTimeClient
      @context.executeAction RealTimeInformationAction.startRealTimeClient
    @context.getStore('RealTimeInformationStore').addChangeListener @onChange
    for id, message of @context.getStore('RealTimeInformationStore').vehicles
      # if tripStartTime has been specified, use only the updates for vehicles with matching startTime
      if !@props.trip || message.tripStartTime == @props.trip
        @updateVehicle(id, message)

  componentWillUnmount: ->
    if @props.startRealTimeClient and @context.getStore('RealTimeInformationStore').addChangeListener.client
      @context.executeAction RealTimeInformationAction.stopRealTimeClient @context.getStore('RealTimeInformationStore').addChangeListener.client
    @context.getStore('RealTimeInformationStore').removeChangeListener @onChange

  onChange: (id) =>
    message = @context.getStore('RealTimeInformationStore').getVehicle(id)
    @updateVehicle(id, message)

  updateVehicle: (id, message) ->
    popup = <Relay.RootContainer
      Component={RouteMarkerPopup}
      route={new queries.FuzzyTripRoute(
        route: message.route
        direction: message.direction
        date: message.operatingDay
        time: message.tripStartTime.substring(0,2) * 60 * 60 + message.tripStartTime.substring(2,4) * 60)}
      renderFetched={(data) =>
        <RouteMarkerPopup trip={data.trip}
                          message={message}
                          context={@context}
                          route={message.route}
                          direction={message.direction}
                          date={message.operatingDay}
                          time={message.tripStartTime.substring(0,2) * 60 * 60 + message.tripStartTime.substring(2,4) * 60}/>
      }/>

    @vehicles[id] =
      <Marker map={@props.map}
              key={id}
              position={lat: message.lat, lng: message.long}
              icon={VehicleMarkerContainer.vehicleIcons[message.mode]}>
        <DynamicPopup options=popupOptions>
          {popup}
        </DynamicPopup>
      </Marker>
    @forceUpdate()

  render: ->
    <div>{((val for key, val of @vehicles))}</div>

module.exports = VehicleMarkerContainer
