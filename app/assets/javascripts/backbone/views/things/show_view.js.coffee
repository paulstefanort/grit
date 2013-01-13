Grit.Views.Things ||= {}

class Grit.Views.Things.ShowView extends Backbone.View
  template: JST["backbone/templates/things/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
