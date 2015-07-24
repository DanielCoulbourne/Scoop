through = require 'through2'
gutil = require 'gulp-util'
PluginError = gutil.PluginError
PLUGIN_NAME = 'gulp-scoop';

# plugin level function (dealing with files)
scoop = (prefixText) ->
	if (!prefixText)
		throw new PluginError PLUGIN_NAME, 'Missing prefix text!'

	prefixText = new Buffer prefixText # allocate ahead of time

	class Tag
		constructor: (@slug) ->
				console.log "Slug: " + @slug
			generatePHP: =>
				console.log '<?php the_field("' + @slug + '"); ?>'
			replaceInString: (string) =>
				newString = string.replace '{{' + @slug + '}}', '<?php the_field("' + @slug + '"); ?>'
				return newString
		error: =>
				console.log "Error: Undefined Property"

	# creating a stream through which each file will pass
	stream = through.obj (file, enc, cb) ->
		if (file.isStream())
			this.emit 'error', new PluginError(PLUGIN_NAME, 'Streams are not supported!')
			return cb()

		if (file.isBuffer())
			file.clone
			pre = file.contents.toString()
			matches = pre.match(/[^{{\]]+(?=}})/g)
			generateTag = (tag, string, callback) ->
				tagObj = new Tag tag #.trim()
				newString = tagObj.replaceInString(string)
				console.log newString
				pre = newString
				callback()
			for tag in matches
				generateTag tag, pre, ->
					console.log "pre: " + pre
					file.contents =  new Buffer pre

		# make sure the file goes through the next gulp plugin
		this.push file

		# tell the stream engine that we are done with this file
		cb()

	# returning the file stream
	return stream;

# exporting the plugin main function
module.exports = scoop;
