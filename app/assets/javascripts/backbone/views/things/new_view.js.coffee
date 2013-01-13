Grit.Views.Things ||= {}

class Grit.Views.Things.NewView extends Backbone.View
  template: JST["backbone/templates/things/new"]

  events:
    "submit #new-thing": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (thing) =>
        @model = thing
        window.location.hash = "/#{@model.id}"

      error: (thing, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this