React                 = require 'react'
Link                  = require 'react-router/lib/Link'
Icon                  = require '../icon/icon'

class BackButton extends React.Component
  @contextTypes:
    history: React.PropTypes.object

  # TODO
  # Transition back in next event loop
  # Without this mobile chrome might call back twice.
  # See: https://github.com/zilverline/react-tap-event-plugin/issues/14
  # This should be removed either when we change how pages are rendered or
  # When react-tap-plugin works better
  goBack: =>
    setTimeout(() =>
      if window.history.length > 1
        @context.history.goBack()
      else
        @context.history.pushState null, process.env.ROOT_PATH
    , 0)

  render: ->
    <div onClick=@goBack className="cursor-pointer icon-holder">
      <Icon img={'icon-icon_arrow-left'} className="cursor-pointer back"/>
    </div>

module.exports = BackButton
