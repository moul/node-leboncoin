{XmlEntities} = require 'html-entities'

unless String::trim then String::trim = -> @replace /^\s+|\s+$/g, ""
String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
String::lstrip = -> @replace /^\s+/g, ""
String::rstrip = -> @replace /\s+$/g, ""

entities = new XmlEntities()

module.exports.clean_string = (input) ->
  output = input
    .replace(/[\n\t\ ]+/g, ' ')
    .replace('&nbsp;', ' ')
    .replace('&euro;', 'E')
    .strip()
  output = entities.decode(output)
  return output
