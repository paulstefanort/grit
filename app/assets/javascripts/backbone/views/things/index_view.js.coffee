Grit.Views.Things ||= {}

class Grit.Views.Things.IndexView extends Backbone.View
  template: JST["backbone/templates/things/index"]

  initialize: () ->
    @options.things.bind('reset', @addAll)

  addAll: () =>
    @options.things.each(@addOne)

  addOne: (thing) =>
    view = new Grit.Views.Things.ThingView({model : thing})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(things: @options.things.toJSON() ))
    @addAll()

    return this
