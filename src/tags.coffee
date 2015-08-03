matchAll = (str , arr) ->
    for item in arr
        if str.indexOf(item) is -1
            return false
    return true


class Tag
    constructor: (@domain, @base, @args) ->
        console.log @domain + "." + @base
        if @args.length > 0
            for arg in args
                console.log "argument: " + arg

parse = (tag) ->
    parts = tag.split('.')

    #parts
    if parts.length > 1
        domain = parts[0]
    else 
        domain = 'default'

    #base
    if parts.length > 1
        base = parts[1]
    else
        base = parts[0]

    #hasArgs
    if matchAll(base, ['(', ')'])
        hasArgs = true
    else
        hasArgs = false

    #args and tagName
    if hasArgs is true
        argsString = base.split('(')[1].split(')')[0]
        tagName = base.split('(')[0]
        args = JSON.parse("[" + argsString + "]")
    else
        args = []
        tagName = base

    return new Tag domain, tagName, args

# test = new Tag "test.testing('test1', 'test2')"
# console.log test.hasArgs()

parse('test.testing("test1","test2")')