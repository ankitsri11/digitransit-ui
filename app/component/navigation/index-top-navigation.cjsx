React                 = require 'react'
Icon                  = require '../icon/icon'
TopNavigation         = require './top-navigation'

class IndexTopNavigation extends React.Component
  render: ->
    disruptionIconClass = if @props.isDisruptions then 'active' else 'inactive'

    <TopNavigation>
      <div onClick={@props.toggleSubnavigation} className="icon-holder cursor-pointer sub-navigation-switch">
        <button>{@props.subnavigationText}</button>
      </div>
      <div onClick={@props.toggleDisruptionInfo} className="icon-holder cursor-pointer disruption-info">
        <Icon img={'icon-icon_caution'} className={'icon disruption-info ' + disruptionIconClass} />
      </div>
      <div onClick={@props.toggleOffcanvas} className="icon-holder cursor-pointer left-off-canvas-toggle">
        <Icon img={'icon-icon_menu'} className="icon" />
      </div>
    </TopNavigation>

module.exports = IndexTopNavigation
