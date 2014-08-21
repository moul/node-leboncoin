cheerio       = require 'cheerio'
request       = require 'request'

defs    = require './defs'
{clean_string} = require './utils'

class Item
  constructor: (@arg) ->

  getUrl: =>
    switch typeof @arg
      when 'number'
        @item_id = @arg
      when 'object'
        if @arg.href?
          @url = @arg.href
      when 'string'
        if parseInt(@arg).toString() == @arg
          @item_id = @arg
        else if /^http/.test(@arg)
          @url = @arg
        else
          throw new Error('Item parsing error')
    if @item_id
      @url = "http://www.leboncoin.fr/locations/#{@item_id}.htm?ca=11_s"
    return @url

  parseHTML: (html) =>
    throw new Error('Not implemented')

  perform: (callback) =>
    _url = do @getUrl
    request _url, (error, response, html) =>
      attrs = @parseHTML html
      callback
        error:    error
        response: response
        html:     html
        attrs:    attrs

module.exports = Item
