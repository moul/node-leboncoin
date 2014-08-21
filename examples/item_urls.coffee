#!/usr/bin/env coffee

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

{Item} = require '..'

entries = []

entries.push
  argument: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
  shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"

entries.push
  argument: "696514990"
  shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"

entries.push
  argument: 696514990
  shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"

entries.push
  argument: { 'href': "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s" }
  shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"

for entry in entries
  item = new Item entry.argument
  console.log "result:    #{do item.getUrl}"
  console.log "should be: #{entry.shouldbe}"
  console.log ''
