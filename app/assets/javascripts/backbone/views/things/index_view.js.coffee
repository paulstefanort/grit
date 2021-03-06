Grit.Views.Things ||= {}

class Grit.Views.Things.IndexView extends Backbone.View
  rendered: false

  template: JST["backbone/templates/things/index"]

  events:
    "click pre": "edit"
    "click .merge": "merge"
    "click .merge_up": "mergeUp"

  initialize: () ->
    @options.things.bind('reset', @addAll)
	
  performOperation: (model) =>
    this.render()

  merge: (item) ->
    item_id = parseInt(item.originalEvent.target.dataset.id)
    next_item_id = 0
    thing = @options.things.get(item_id)
    @options.things.each (thing) ->
      if (thing.id > item_id) && (next_item_id == 0)
        next_item_id = thing.id
    if next_item_id != 0
      next_thing = @options.things.get(next_item_id)
      thing.save({content: thing.attributes.content + "\n\n" + next_thing.attributes.content})
      next_thing.destroy()
      this.render()

  mergeUp: (item) ->
    item_id = parseInt(item.originalEvent.target.dataset.id)
    previous_item_id = 0
    thing = @options.things.get(item_id)
    @options.things.each (thing) ->
      if (thing.id < item_id) && (thing.id > previous_item_id)
        previous_item_id = thing.id
    if previous_item_id != 0
      previous_thing = @options.things.get(previous_item_id)
      thing.save({content: previous_thing.attributes.content + "\n\n" + thing.attributes.content})
      previous_thing.destroy()
      this.render()

  edit: (item) ->
    this.render()
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
