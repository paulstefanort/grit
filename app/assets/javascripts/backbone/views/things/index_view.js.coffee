Grit.Views.Things ||= {}

class Grit.Views.Things.IndexView extends Backbone.View
  rendered: false

  template: JST["backbone/templates/things/index"]

  events:
    "click pre": "edit"

  initialize: () ->
    @options.things.bind('reset', @addAll)
	
  performOperation: (model) =>
    this.render()

  edit: (item) ->
    item_id = item.originalEvent.target.dataset.id
    window.location.hash = "/" + item_id + "/edit"

  addAll: () =>
    @options.things.each(@addOne)

  addOne: (thing) =>
    view = new Grit.Views.Things.ThingView({model : thing})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(things: @options.things.toJSON() ))
    @addAll()

    return this
