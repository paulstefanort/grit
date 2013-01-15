class Grit.Routers.ThingsRouter extends Backbone.Router
  initialize: (options) ->
    @things = new Grit.Collections.ThingsCollection()
    @things.reset options.things

  routes:
    "new"      : "newThing"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newThing: ->
    @view = new Grit.Views.Things.NewView(collection: @things)
    $("#things").html(@view.render().el)

  index: ->
    @view = new Grit.Views.Things.IndexView(things: @things)
    $("#things").html(@view.render().el)

    newEntryFormView = new Grit.Views.Things.NewView(collection: @things, indexView: @view)
    newEntryFormView.on('addedNewEntry', @view.render, @view)
    newEntryFormView.off('addedNewEntry', @view.render, @view)
    $("#new_entry_form").html(newEntryFormView.render().el)

  show: (id) ->
    thing = @things.get(id)

    @view = new Grit.Views.Things.ShowView(model: thing)
    $("#things").html(@view.render().el)

  edit: (id) ->
    thing = @things.get(id)

    @view = new Grit.Views.Things.EditView(model: thing)
    $("#things").html(@view.render().el)
