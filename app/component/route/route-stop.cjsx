React                 = require 'react'
Relay                 = require 'react-relay'
queries               = require '../../queries'
Link                  = require 'react-router/lib/Link'
TripLink              = require '../trip/trip-link'

class RouteStop extends React.Component

  render: ->
    vehicles = []
    if @props.vehicles
      for vehicle in @props.vehicles
        vehicles.push <Relay.RootContainer
          Component={TripLink}
          route={new queries.FuzzyTripRoute(
            route: vehicle.route
            direction: vehicle.direction
            date: vehicle.operatingDay
            time: vehicle.tripStartTime.substring(0, 2) * 60 * 60 + vehicle.tripStartTime.substring(2, 4) * 60
          )}/>

    <div className="route-stop row">
      <div className="columns small-3 route-stop-now">
        {vehicles}
      </div>
      <Link to="#{process.env.ROOT_PATH}pysakit/#{@props.stop.gtfsId}">
        <div className={"columns small-6 route-stop-name " + @props.mode}>
          {@props.stop.name}<br/>
            <span className="route-stop-address">
              {@props.stop.desc}
            </span>
        </div>
        <div className="columns small-2 route-stop-code">
          {@props.stop.code}
        </div>
        <div className="columns small-1 route-stop-mins">
          {@props.stop.minutes}
       </div>
      </Link>
    </div>

module.exports = RouteStop
