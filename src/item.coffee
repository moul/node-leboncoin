cheerio       = require 'cheerio'
request       = require 'request'

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
    attrs = {}
    opts =
      normalizeWhitespace: true
      decodeEntities: true
    $ = cheerio.load html, opts
    for row in $('.lbcParams > table > tr')
      key = clean_string $(row).find('th').html().replace(':', ' ')
      value = clean_string $(row).find('td').html()
      attrs[key] = value

    attrs.thumbs = []
    for thumb in $('#thumbs_carousel .thumbs_cadre span')
      attrs.thumbs.push $(thumb).css('background-image').split("'")[1]

    attrs.description = clean_string $('.AdviewContent > .content').html()
    return attrs

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
