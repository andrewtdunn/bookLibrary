app = app || {}

app.Book = Backbone.Model.extend(
	defaults:
		coverImage: 'img/placeHolder.png'
		title: 'No title'
		author: 'Unknown'
		releaseDate: 'Unknown'
		keywords: 'None'
	)