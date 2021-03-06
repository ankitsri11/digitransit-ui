React                       = require 'react'
Icon                        = require '../icon/icon'
CustomizeSearch             = require '../summary/customize-search'
BackButton                  = require './back-button'
TimeSelectors               = require './time-selectors'


class SummaryNavigation extends React.Component
  constructor: ->
    super
    @state =
      customizeSearchOffcanvas: false

  toggleCustomizeSearchOffcanvas: =>
    @setState customizeSearchOffcanvas: !@state.customizeSearchOffcanvas

  render: ->
    <div className="fullscreen">
      <CustomizeSearch open={@state.customizeSearchOffcanvas}/>

      <div className="fullscreen grid-frame">
        <div className="fixed">
          <nav className="top-bar">
            <BackButton/>
            <TimeSelectors/>
            <div onClick={@toggleCustomizeSearchOffcanvas} className="icon-holder cursor-pointer right-off-canvas-toggle">
              <Icon img={'icon-icon_ellipsis'}/>
            </div>
          </nav>
        </div>
        <section ref="content" className="content">
          {@props.children}
        </section>
      </div>
    </div>

module.exports = SummaryNavigation
