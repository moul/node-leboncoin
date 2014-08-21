#!/usr/bin/env coffee

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

leboncoin = require '..'

search = new leboncoin.Search
  region:   'haute_normandie'
  query:    'boxe OR box OR stockage OR stocker OR cave OR garage NOT studio NOT F1 NOT F2 NOT F3 NOT T1 NOT T2 NOT T3 NOT appartement'
  category_attrs:
    mre:    600         # loyer max = 600
  category: 'locations'

search.perform (response) ->
  if response.error
    console.err response.error
    return

  for result in response.results
    continue unless result.image # comment to get detail for items without images
    console.log result

    item = new leboncoin.Item result
    item.perform (result) ->
      console.log result.attrs

    # return # uncomment to do only one item detail
