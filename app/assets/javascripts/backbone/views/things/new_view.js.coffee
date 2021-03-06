Grit.Views.Things ||= {}

class Grit.Views.Things.NewView extends Backbone.View
  template: JST["backbone/templates/things/new"]

  events:
    "submit #new-thing": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @indexView = options.indexView

    @model.bind("change:errors", () =>
      this.render()
    )

  addedItem: () ->
    @model = new @collection.model()
    this.render()
    this.lastKeyCode = 0

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    $("#content").focus() if (@model.attributes.content == "" || @model.attributes.content == null)
    return if (@model.attributes.content == "" || @model.attributes.content == null)

    @collection.create(@model.toJSON(),
      success: (thing) =>
        @model = thing
        @indexView.performOperation(thing)
        this.addedItem()

      error: (thing, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
