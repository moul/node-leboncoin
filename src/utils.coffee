{XmlEntities} = require 'html-entities'

unless String::trim then String::trim = -> @replace /^\s+|\s+$/g, ""
String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
String::lstrip = -> @replace /^\s+/g, ""
String::rstrip = -> @replace /\s+$/g, ""

entities = new XmlEntities()

module.exports.clean_string = (input) ->
  # FIXME: remove <script>.*</script>, then remove <.*>
  output = input
    .replace(/[\n\t\ ]+/g, ' ')
    .replace('&nbsp;', ' ')
    .replace('&euro;', 'E')
    .replace(/<script.*?>.*?<\/script>/gim, '')
    .replace(/<[^>]*>/g, '')
    .strip()
  output = entities.decode(output)
  return output
