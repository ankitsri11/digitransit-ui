React          = require 'react'
ReactAutosuggest = require 'react-autosuggest'
Icon           = require '../icon/icon'
XhrPromise     = require '../../util/xhr-promise.coffee'
config         = require '../../config'

AUTOSUGGEST_ID = 'autosuggest'

class Autosuggest extends React.Component

  getName: (suggestion) ->
    switch suggestion.layer
      when 'address'
        "#{suggestion.street} #{suggestion.housenumber}, #{suggestion.locality}"
      when 'locality'
        "#{suggestion.name}"
      when 'neighbourhood'
        "#{suggestion.name}, #{suggestion.locality}"
      when 'venue'
        "#{suggestion.name}, #{suggestion.locality}"
      else
        "#{suggestion.label}"

  getIcon: (layer) ->
    switch layer
      when 'address'
        <Icon img="icon-icon_place"/>
      when 'stop'
        <Icon img="icon-icon_bus-stop"/>
      when 'locality'
        <Icon img="icon-icon_city"/>
      when 'localadmin'
        <Icon img="icon-icon_city"/>
      when 'neighbourhood'
        <Icon img="icon-icon_city"/>
      else
        <Icon img="icon-icon_place"/>

  getSuggestions: (input, callback) ->
    opts = Object.assign(text: input, config.searchParams)

    XhrPromise.getJson(config.URL.PELIAS, opts).then (res) -> callback null, res.features

  renderSuggestions: (suggestion, input) =>
    return <span>
        {@getIcon suggestion.properties.layer}
        {@getName suggestion.properties}
      </span>

  suggestionValue: (suggestion) =>
    @getName suggestion.properties

  onSuggestionSelected: (suggestion, event) =>
    event.preventDefault()
    @props.onSelection suggestion.geometry.coordinates[1],
                       suggestion.geometry.coordinates[0],
                       @getName suggestion.properties

  # Happens when user presses enter without selecting anything from autosuggest
  onSubmit: (e) =>
    e.preventDefault()
    @getSuggestions @refs.input.state.value, (err, values) => @onSuggestionSelected values[0], e

  render: =>
    inputAttributes =
      id: AUTOSUGGEST_ID
      placeholder: @props.placeholder

    <form onSubmit={@onSubmit}>
      <ReactAutosuggest
        ref="input"
        suggestions={@getSuggestions}
        suggestionRenderer={@renderSuggestions}
        suggestionValue={@suggestionValue}
        defaultValue={@props.value}
        showWhen={(input) -> input.trim().length >= 2}
        onSuggestionSelected={@onSuggestionSelected}
        inputAttributes={
          placeholder: @props.placeholder
          #onBlur: @onSubmit Uh, causes a bug, as it is called after bluring the input after a selection has been done
        }
        id={@props.id}
        scrollBar={true}
      />
    </form>

module.exports = Autosuggest
