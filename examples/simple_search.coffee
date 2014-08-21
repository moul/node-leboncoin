#!/usr/bin/env coffee

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

leboncoin = require '..'

search = new leboncoin.Search
  region:   'haute_normandie'
  location: 27000
  category_attrs:
    mrs:    600         # loyer min = 600
    mre:    1300        # loyer max = 1300
    sqs:    11          # surface min = 100m
    ret:    [1]         # type = maison
  category: 'locations'

search.perform (response) ->
  console.log response
