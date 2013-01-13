class Grit.Models.Thing extends Backbone.Model
  paramRoot: 'thing'

  defaults:
    content: null

class Grit.Collections.ThingsCollection extends Backbone.Collection
  model: Grit.Models.Thing
  url: '/things'
