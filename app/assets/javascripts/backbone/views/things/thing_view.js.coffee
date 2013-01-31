Grit.Views.Things ||= {}

class Grit.Views.Things.ThingView extends Backbone.View
  template: JST["backbone/templates/things/thing"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    if confirm "Are you sure you want to delete this?"
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
