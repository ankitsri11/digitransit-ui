React           = require 'react'
Link            = require 'react-router/lib/Link'
Icon            = require '../icon/icon'
classnames      = require 'classnames'
TripLink        = require '../trip/trip-link'
moment          = require 'moment'
cx              = require 'classnames'

class TripRouteStop extends React.Component
  renderTime: (realtimeDeparture, currentTimeFromMidnight, realtime) ->
    # times are given in minutes since midnight
    departureTime = moment().startOf('day').second(realtimeDeparture)
    return (moment(departureTime).format "HH:mm")
    # TODO: display real-time estimation to the stop

  render: ->
    vehicles = []
    if @props.vehicle
      vehicles.push <Icon id="now"
                          key={@props.vehicle.id}
                          className={cx @props.mode, 'large-icon'}
                          img={"icon-icon_#{@props.mode}-live"}
        />

    stopPassed =
      passed: !@props.stopPassed

    <div className={classnames "route-stop row", stopPassed}>
      <div className="columns small-3 route-stop-time">
        {@renderTime(@props.realtimeDeparture, @props.currentTimeFromMidnight, @props.realtime)}
        <div className="route-stop-now-icon">
          {vehicles}
        </div>
      </div>

      <Link to="#{process.env.ROOT_PATH}pysakit/#{@props.stop.gtfsId}">
        <div className={"columns small-7 route-stop-name " + @props.mode}>
          {@props.stop.name}<br/>
          <span className="route-stop-address">
            {@props.stop.desc}
          </span>
        </div>
        <div className="columns small-2 route-stop-code">
          {@props.stop.code}
        </div>
      </Link>
    </div>

module.exports = TripRouteStop
