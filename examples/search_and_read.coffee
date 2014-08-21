#!/usr/bin/env coffee

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

#Search = require 'leboncoin'
Search = require '..'

search = new Search
  region:   'haute_normandie'
  query:    'boxe OR box OR stockage OR stocker OR cave OR garage NOT studio NOT F1 NOT F2 NOT F3 NOT T1 NOT T2 NOT T3 NOT appartement'
  category_attrs:
    mrs:    0           # loyer min = 600
    mre:    600         # loyer max = 2300
  category: 'locations'

search.perform (response) ->
  if response.error
    console.err response.error
    return

  console.log response.results
