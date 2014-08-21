unless String::trim then String::trim = -> @replace /^\s+|\s+$/g, ""
String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
String::lstrip = -> @replace /^\s+/g, ""
String::rstrip = -> @replace /\s+$/g, ""

module.exports.clean_string = (string) ->
  return string
    .replace(/[\n\t\ ]+/g, ' ')
    .replace('&nbsp;', ' ')
    .replace('&euro;', 'E')
    .strip()
