app = app || {}

app.BookView = Backbone.View.extend(
	tagName: 'div'
	className: 'bookContainer'
	template: _.template $('#bookTemplate').html()

	events: 
		'click .delete': 'deleteBook'

	deleteBook: ->
		# delete model
		@model.destroy()

		# delete view
		@.remove()

	render: ->
		# tmpl is a function that takes a JSON object and returns html

		# this.el is what we defined in tagName. use $el to get access
		# to jQuery html() function
		@$el.html @template @model.toJSON()
		return @
	)