Grit.Views.Things ||= {}

class Grit.Views.Things.EditView extends Backbone.View
  template: JST["backbone/templates/things/edit"]

  events:
    "submit #edit-thing": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (thing) =>
        @model = thing
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
