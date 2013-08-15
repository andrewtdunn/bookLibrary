app = app || {}

app.LibraryView = Backbone.View.extend(
	el: "#books"
	initialize: ()->
		@collection = new app.Library
		@collection.fetch {reset: true}
		@render()
		#@collection.on 'add', @renderBook, @collection[0]
		@listenTo @collection, 'add', @renderBook
		@listenTo @collection, 'reset', @render
		return

	events: 
		'click #add':'addBook'

	addBook: (e) ->
		e.preventDefault()

		formData = {}
		$("#addBook div").children("input").each (i, el) ->
			unless $(el).val() is ""
				if el.id is 'keywords'
					formData[el.id] = []
					_.each $(el).val().split(' '), (keyword)->
						formData[el.id].push 'keyword': keyword
						return
				else if el.ed is "releaseDate"
					forData[el.id] = $('#releaseDate').datePicker('getDate').getTime()
				else
					formData[el.id] = $(el).val()
			$(el).val('')
			return

		@collection.create formData
		return

  		
  			


	# render library by rendering each book in its collection
	render: ->
		@collection.each(
				(item)->
					@renderBook item
					return
				@
			)
		return

	# render a book by creating a Bookview and appending the 
	# element it renders to the library's element
	renderBook: (item)->
		bookView = new app.BookView(
			model:item
			)
		@$el.append bookView.render().el
		return 
	)

	
