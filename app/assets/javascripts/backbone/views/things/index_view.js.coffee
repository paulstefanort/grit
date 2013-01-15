Grit.Views.Things ||= {}

class Grit.Views.Things.IndexView extends Backbone.View
  rendered: false

  template: JST["backbone/templates/things/index"]

  initialize: () ->
    @options.things.bind('reset', @addAll)
	
  performOperation: (model) =>
    this.render()

  addAll: () =>
    @options.things.each(@addOne)

  addOne: (thing) =>
    view = new Grit.Views.Things.ThingView({model : thing})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(things: @options.things.toJSON() ))
    @addAll()

    return this
