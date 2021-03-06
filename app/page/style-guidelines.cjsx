React              = require 'react'
Icon               = require '../component/icon/icon'
Link               = require('react-router/lib/Link').Link
# React Components
ComponentUsageExample = require '../component/documentation/component-usage-example'
ComponentDocumentation  = require '../component/documentation/component-documentation'
Departure          = require '../component/departure/departure'
RouteNumber        = require '../component/departure/route-number'
RouteDestination   = require '../component/departure/route-destination'
DepartureTime      = require '../component/departure/departure-time'

realtimeDeparture = {
  "stoptime": 1444165199,
  "realtime": true,
  "pattern": {
    "__dataID__": "UGF0dGVybjpIU0w6NDYxMToxOjAx",
    "route": {
      "__dataID__": "Um91dGU6SFNMOjQ2MTE=",
      "gtfsId": "HSL:4611",
      "shortName": "611",
      "longName": "Rautatientori - Siltamäki - Suutarila - Tikkurila",
      "type": "BUS",
      "color": null
    },
    "code": "HSL:4611:1:01",
    "headsign": "Rautatientori"
  }
}
departure = {
  "stoptime": 1444185960,
  "realtime": false,
  "pattern": {
    "__dataID__": "UGF0dGVybjpIU0w6MTAwN0I6MDowMg==",
    "route": {
      "__dataID__": "Um91dGU6SFNMOjEwMDdC",
      "gtfsId": "HSL:1007B",
      "shortName": "7B",
      "longName": "Senaatintori-Pasila-Töölö-Senaatintori",
      "type": "TRAM",
      "color": null
    },
    "code": "HSL:1007B:0:02",
    "headsign": "Pasila"
  }
}

class StyleGuidelinesPage extends React.Component
  getColors: ->
    return (
      <section>
        <div className="medium-6 column">
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#007ac9'}/>
          </svg>
          <span className="code color-code">$primary-color</span>#007ac9
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#ffffff'}/>
          </svg>
          <span className="code color-code">$primary-font-color</span>#ffffff
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#0062a1'}/>
          </svg>
          <span className="code color-code">$secondary-color</span>#0062a1
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#ffffff'}/>
          </svg>
          <span className="code color-code">$secondary-font-color</span>#ffffff
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#ffffff'}/>
          </svg>
          <span className="code color-code">$title-color</span>#ffffff
          <br />
        </div>
        <div className="medium-6 column">
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#f092cd'}/>
          </svg>
          <span className="code color-code">$favourite-color</span>#f092cd
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#f092cd'}/>
          </svg>
          <span className="code color-code">$hilight-color</span>#f092cd
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#007ac9'}/>
          </svg>
          <span className="code color-code">$action-color</span>#007ac9
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#fed100'}/>
          </svg>
          <span className="code color-code">$disruption-color</span>#fed100
          <br />
          <svg className="color-palette" width="50" height="50">
            <rect width="50" height="50" style={fill:'#4DA2D9'}/>
          </svg>
          <span className="code color-code">$disruption-passive-color</span>#4DA2D9
        </div>
        <p>TODO: dynamically get these colors, now only for HSL</p>
      </section>
    );

  getFonts: ->
    return (
      <section>
        <span className="code">$font-family</span>
        <p style={{fontWeight: '300 '}}>Primary font narrow - Weight 300: "Nunito, Arial, Georgia, Serif"<span className="code">$font-weight-light</span></p>
        <p style={{fontWeight: '400 '}}>Primary font normal - Weight 400: "Nunito, Arial, Georgia, Serif"<span className="code">$font-weight-normal</span></p>
        <p style={{fontWeight: '600 '}}>Primary font bold   - Weight 600: "Nunito, Arial, Georgia, Serif"<span className="code">$font-weight-bold</span></p>
        <span className="code">$font-family-narrow</span>
        <p style={fontFamily: 'Open Sans Condensed', fontWeight:'400'}>Secondary font: 'Open Sans Condensed', 'Arial Condensed', Arial, Georgia, Serif<span className="code">$font-weight-normal</span></p>
        <p style={fontFamily: 'Open Sans Condensed', fontWeight:'600'}>Secondary font: 'Open Sans Condensed', 'Arial Condensed', Arial, Georgia, Serif<span className="code">$font-weight-bold</span></p>
      </section>
    );

  getHeadings: ->
    <section>
      <h1>Heading 1<span className="code">{"<h1>"}</span></h1>
      <h2>Heading 2<span className="code">{"<h2>"}</span></h2>
      <h3>Heading 3<span className="code">{"<h3>"}</span></h3>
      <h4>Heading 4<span className="code">{"<h4>"}</span></h4>
      <h5>Heading 5<span className="code">{"<h5>"}</span></h5>
      <h6>Heading 6<span className="code">{"<h6>"}</span></h6>
    </section>

  getSubHeaders: ->
    <section>
      <p className="sub-header-h4">This is a sub header<span className="code">.sub-header-h4</span></p>
    </section>

  getTextStyles: ->
    <section>
      <a href="#">This is a link</a><span className="code">{"<a>"}</span>
      <p>Paragraph: normal text looks like this<span className="code">{"<p>"}</span></p>
      <span>span style</span><span className="code">{"<span>"}</span>
      <p className="bold">this text is bold<span className="code">.bold or {"<b>"}</span></p>
    </section>

  getIcons: ->
    <section>
      Import: <p className="code">Icon = require '../icon/icon'</p><br />
      <div className="medium-4 column">
        <Icon img={'icon-icon_arrow-collapse'}/>
        <span className="code">icon-icon_arrow-collapse</span><br />
        <Icon img={'icon-icon_arrow-down'}/>
        <span className="code">icon-icon_arrow-down</span><br />
        <Icon img={'icon-icon_arrow-dropdown'}/>
        <span className="code">icon-icon_arrow-dropdown</span><br />
        <Icon img={'icon-icon_arrow-left'}/>
        <span className="code">icon-icon_arrow-left</span><br />
        <Icon img={'icon-icon_arrow-right'}/>
        <span className="code">icon-icon_arrow-right</span><br />
        <Icon img={'icon-icon_arrow-up'}/>
        <span className="code">icon-icon_arrow-up</span><br />
        <Icon img={'icon-icon_bus-stop'}/>
        <span className="code">icon-icon_bus-stop</span><br />
        <Icon img={'icon-icon_bus-withoutBox'}/>
        <span className="code">icon-icon_bus-withoutBox</span><br />
        <Icon img={'icon-icon_bus'}/>
        <span className="code">icon-icon_bus</span><br />
        <Icon className="icon-test" img={'icon-icon_bus-live'}/>
        <span className="code">icon-icon_bus-live</span><br />
        <Icon img={'icon-icon_car'}/>
        <span className="code">icon-icon_car</span><br />
        <Icon img={'icon-icon_caution'}/>
        <span className="code">icon-icon_caution</span><br />
        <Icon img={'icon-icon_close'}/>
        <span className="code">icon-icon_close</span><br />
        <Icon img={'icon-icon_cycle'}/>
        <span className="code">icon-icon_cycle</span><br />
        <Icon img={'icon-icon_cyclist'}/>
        <span className="code">icon-icon_cyclist</span><br />
        <Icon img={'icon-icon_direction-a'}/>
        <span className="code">icon-icon_direction-a</span><br />
        <Icon img={'icon-icon_direction-b'}/>
        <span className="code">icon-icon_direction-b</span><br />
        <Icon img={'icon-icon_thumb-down'}/>
        <span className="code">icon-icon_thumb-down</span><br />
        <Icon img={'icon-icon_thumb-up'}/>
        <span className="code">icon-icon_thumb-up</span><br />
      </div>
      <div className="medium-4 column">
        <Icon img={'icon-icon_airplane'}/>
        <span className="code">icon-icon_airplane</span><br />
        <Icon img={'icon-icon_airplane-withoutBox'}/>
        <span className="code">icon-icon_airplane-withoutBox</span><br />
        <Icon img={'icon-icon_ellipsis'}/>
        <span className="code">icon-icon_ellipsis</span><br />
        <Icon img={'icon-icon_ferry-withoutBox'}/>
        <span className="code">icon-icon_ferry-withoutBox</span><br />
        <Icon img={'icon-icon_ferry'}/>
        <span className="code">icon-icon_ferry</span><br />
        <Icon img={'icon-icon_ferry-live'}/>
        <span className="code">icon-icon_ferry-live</span><br />
        <Icon img={'icon-icon_HSL-logo'}/>
        <span className="code">icon-icon_HSL-logo</span><br />
        <Icon img={'icon-icon_info'}/>
        <span className="code">icon-icon_info</span><br />
        <Icon img={'icon-icon_kutsuplus'}/>
        <span className="code">icon-icon_kutsuplus</span><br />
        <Icon img={'icon-icon_mapMarker-location'}/>
        <span className="code">icon-icon_mapMarker-location</span><br />
        <Icon img={'icon-icon_mapMarker-point'}/>
        <span className="code">icon-icon_mapMarker-point</span><br />
        <Icon img={'icon-icon_maximize'}/>
        <span className="code">icon-icon_maximize</span><br />
        <Icon img={'icon-icon_menu'}/>
        <span className="code">icon-icon_menu</span><br />
        <Icon img={'icon-icon_minimize'}/>
        <span className="code">icon-icon_minimize</span><br />
        <Icon img={'icon-icon_pause'}/>
        <span className="code">icon-icon_pause</span><br />
        <Icon img={'icon-icon_place'}/>
        <span className="code">icon-icon_place</span><br />
        <Icon img={'icon-icon_plus'}/>
        <span className="code">icon-icon_plus</span><br />
        <Icon img={'icon-icon_print'}/>
        <span className="code">icon-icon_print</span><br />
        <Icon img={'icon-icon_city'}/>
        <span className="code">icon-icon_city</span><br />
      </div>
      <div className="medium-4 column">
        <Icon img={'icon-icon_rail-withoutBox'}/>
        <span className="code">icon-icon_rail-withoutBox</span><br />
        <Icon img={'icon-icon_rail'}/>
        <span className="code">icon-icon_rail</span><br />
        <Icon img={'icon-icon_rail-live'}/>
        <span className="code">icon-icon_rail-live</span><br />
        <Icon img={'icon-icon_route'}/>
        <span className="code">icon-icon_route</span><br />
        <Icon img={'icon-icon_search'}/>
        <span className="code">icon-icon_search</span><br />
        <Icon img={'icon-icon_share'}/>
        <span className="code">icon-icon_share</span><br />
        <Icon img={'icon-icon_star'}/>
        <span className="code">icon-icon_star</span><br />
        <Icon img={'icon-icon_station'}/>
        <span className="code">icon-icon_station</span><br />
        <Icon img={'icon-icon_subway-withoutBox'}/>
        <span className="code">icon-icon_subway-withoutBox</span><br />
        <Icon img={'icon-icon_subway'}/>
        <span className="code">icon-icon_subway</span><br />
        <Icon img={'icon-icon_subway-live'}/>
        <span className="code">icon-icon_subway-live</span><br />
        <Icon img={'icon-icon_time'}/>
        <span className="code">icon-icon_time</span><br />
        <Icon img={'icon-icon_tram-withoutBox'}/>
        <span className="code">icon-icon_tram-withoutBox</span><br />
        <Icon img={'icon-icon_tram'}/>
        <span className="code">icon-icon_tram</span><br />
        <Icon img={'icon-icon_tram-live'}/>
        <span className="code">icon-icon_tram-live</span><br />
        <Icon img={'icon-icon_user'}/>
        <span className="code">icon-icon_user</span><br />
        <Icon img={'icon-icon_waiting'}/>
        <span className="code">icon-icon_waiting</span><br />
        <Icon img={'icon-icon_walk'}/>
        <span className="code">icon-icon_walk</span><br />
        <Icon img={'icon-icon_mapMarker-location-animated'}/>
        <span className="code">icon-icon_mapMarker-location-animated</span>
      </div>
      <p>
        <Icon className="large-icon" img={'icon-icon_subway-live'}/>
        <span className="code">.large-icon</span><br />
        <Icon className="large-icon" img={'icon-icon_user'}/>
        <span className="code">.large-icon</span><br />
      </p>
    </section>

  getHelpers: ->
    <section>
      <div className="bus">some div<span className="code">.bus</span></div>
      <div className="tram">some div<span className="code">.tram</span></div>
      <div className="rail">some div<span className="code">.rail</span></div>
      <div className="subway">some div<span className="code">.subway</span></div>
      <div className="ferry">some div<span className="code">.ferry</span></div>

      <div className="walk">some div<span className="code">.walk</span></div>
      <div className="from">some div<span className="code">.from</span></div>
      <div className="to">some div<span className="code">.to</span></div>
      <br/>
      <div className="cursor-pointer">some div<span className="code">.cursor-pointer</span></div>
      <div className="dashed-underline">some div<span className="code">.dashed-underline</span></div>
      <div className="bold">some div<span className="code">.bold</span></div>
      <div className="uppercase">some div<span className="code">.uppercase</span></div>
      <br/>
      <div className="padding-small border-dashed">the border is not part of the style<span className="code">.padding-small</span></div>
      <div className="padding-normal border-dashed">some div<span className="code">.padding-normal</span></div>
      <div className="padding-vertical-small border-dashed">some div<span className="code">.padding-vertical-small</span></div>
      <div className="padding-vertical-normal border-dashed">some div<span className="code">.padding-vertical-normal</span></div>
      <div className="padding-horizontal border-dashed">some div<span className="code">.padding-horizontal</span></div>
      <div className="no-padding">some div<span className="code">.no-padding</span></div>
      <div className="no-margin">some div<span className="code">.no-margin</span></div>
      <br/>
      <div className="left">float left<span className="code">.left</span></div>
      <div className="right">float right<span className="code">.right</span></div>
      <div className="clear">flot is cleared<span className="code">.clear</span></div>
      <div className="text-left">text aligned to left<span className="code">.text-left</span></div>
      <div className="text-right">text aligned to right<span className="code">.text-right</span></div>
      <div className="text-center">text centered aligned<span className="code">.text-center</span></div>
      <div className="inline-block">this div is inlied<span className="code">.inline-block</span></div>
      <div className="inline-block">this also<span className="code">.inline-block</span></div>
    </section>

  getDepartureMolecules: ->
    currentTime = new Date().getTime() / 1000
    <div>
      <ComponentDocumentation component=Departure>
        <ComponentUsageExample>
          <Departure departure={realtimeDeparture} currentTime={currentTime}/>
        </ComponentUsageExample>
        <ComponentUsageExample description="adding padding classes">
          <Departure departure={departure} currentTime={currentTime} className="padding-normal padding-bottom"/>
        </ComponentUsageExample>
      </ComponentDocumentation>

      <ComponentDocumentation component=DepartureTime>
        <ComponentUsageExample description="real time">
          <DepartureTime departureTime={realtimeDeparture.stoptime} realtime={realtimeDeparture.realtime} currentTime={currentTime}/>
        </ComponentUsageExample>
        <ComponentUsageExample description="not real time">
          <DepartureTime departureTime={departure.stoptime} realtime={departure.realtime} currentTime={currentTime}/>
        </ComponentUsageExample>
      </ComponentDocumentation>

      <ComponentDocumentation component=RouteNumber>
        <ComponentUsageExample>
          <RouteNumber mode={realtimeDeparture.pattern.route.type} text={realtimeDeparture.pattern.route.shortName}/>
        </ComponentUsageExample>
      </ComponentDocumentation>

      <ComponentDocumentation component=RouteDestination>
        <ComponentUsageExample>
          <RouteDestination mode={realtimeDeparture.pattern.route.type} destination={realtimeDeparture.pattern.headsign or realtimeDeparture.pattern.route.longName}/>
        </ComponentUsageExample>
      </ComponentDocumentation>

      <div className="card padding-normal">
        <h2>StopReference</h2>
        TODO
        <p>Display stop number / platform number, Text color depends on mode</p>
        <p>Props:</p>
        <ul>
          <li>mode</li>
          <li>stop</li>
        </ul>
      </div>
    </div>

  render: ->
    <div className="container column">
      <h1>UI Elements</h1>
      <hr></hr>

      <div className="sub-header">Colors</div>
      {@getColors()}

      <hr></hr>
      <div className="sub-header">Fonts</div>
      {@getFonts()}

      <hr></hr>
      <div className="sub-header">Text Styles</div>
      {@getTextStyles()}

      <hr></hr>
      <div className="sub-header">Headings</div>
      {@getHeadings()}

      <hr></hr>
      <div className="sub-header">Sub Headings</div>
      {@getSubHeaders()}

      <hr></hr>
      <div className="sub-header">Icons</div>
      {@getIcons()}

      <hr></hr>
      <div className="sub-header">Helper Classes</div>
      {@getHelpers()}

      <hr></hr>
      <h1>Components</h1>
      <hr></hr>

      {@getDepartureMolecules()}

      <p></p>
    </div>

module.exports = StyleGuidelinesPage
