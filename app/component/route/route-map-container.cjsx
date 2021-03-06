React              = require 'react'
Relay              = require 'react-relay'
queries            = require '../../queries'
Map                = require '../map/map'
RouteLine          = require '../map/route-line'
GtfsUtils          = require '../../util/gtfs'
VehicleMarkerContainer = require '../map/vehicle-marker-container'
Icon               = require '../icon/icon'
Link               = require 'react-router/lib/Link'


class RouteMapContainer extends React.Component
  @contextTypes:
    history: React.PropTypes.object.isRequired

  @defaultProps: ->
    fullscreen: false

  toggleFullscreenMap: =>
    @context.history.pushState null, "#{process.env.ROOT_PATH}lahdot/#{@props.tripId}/kartta"

  # map can be toggeled fullscreen on Trip page
  getFullScreenToggle: ->
    if @props.tripId
      if @props.fullscreen
        <Link to="#{process.env.ROOT_PATH}lahdot/#{@props.tripId}">
          <div className="fullscreen-toggle">
            <Icon img={'icon-icon_maximize'} className="cursor-pointer" />
          </div>
        </Link>
      else
        <div>
          <div className="map-click-prevent-overlay" onClick={@toggleFullscreenMap}/>
          <Link to="#{process.env.ROOT_PATH}lahdot/#{@props.tripId}/kartta">
            <div className="fullscreen-toggle">
              <Icon img={'icon-icon_maximize'} className="cursor-pointer" />
            </div>
          </Link>
        </div>

  onChange: ->
    @forceUpdate()

  render: ->
    stops = @props.pattern.stops

    leafletObj = [
      <RouteLine key="line" pattern={@props.pattern} />
      <VehicleMarkerContainer key="vehicles" pattern={@props.pattern.code} trip={@props.trip}/>
    ]

    <Map
      className={@props.className}
      leafletObjs={leafletObj}
      fitBounds={true}
      from={stops[0]}
      to={stops[stops.length-1]}>

      {@getFullScreenToggle()}
    </Map>

module.exports = Relay.createContainer(RouteMapContainer, fragments: queries.RouteMapFragments)
