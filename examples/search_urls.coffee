#!/usr/bin/env coffee

# clear terminal
# process.stdout.write '\u001B[2J\u001B[0;0f'

Search = require('..').search

searchs = []

searchs.push new Search
    region:     'haute_normandie'
    department: 'eure'
    shouldbe:   'http://www.leboncoin.fr/annonces/offres/haute_normandie/eure/'

searchs.push new Search
    region:     'haute_normandie'
    department: 'occasions' # Toute la france
    shouldbe:   'http://www.leboncoin.fr/annonces/offres/haute_normandie/occasions/'

searchs.push new Search
    region:     'haute_normandie'
    department: 'bonnes_affaires' # Régions voisines
    shouldbe:   'http://www.leboncoin.fr/annonces/offres/haute_normandie/bonnes_affaires/'

searchs.push new Search
    query:    'test'
    shouldbe: 'http://www.leboncoin.fr/annonces/offres/ile_de_france/occasions/?q=test'

searchs.push new Search
    query:    'test'
    filter:   'a'
    shouldbe: 'http://www.leboncoin.fr/annonces/offres/ile_de_france/occasions/?q=test'

searchs.push new Search
    query:        'test'
    filter:       'a'
    urgency_only: 1
    shouldbe:     'http://www.leboncoin.fr/annonces/offres/ile_de_france/occasions/?q=test&ur=1'

searchs.push new Search
    query:    'test'
    filter:   'p'
    shouldbe: 'http://www.leboncoin.fr/annonces/offres/ile_de_france/occasions/?q=test&f=p'

searchs.push new Search
    filter:   'c'
    page:     2
    shouldbe: 'http://www.leboncoin.fr/annonces/offres/ile_de_france/occasions/?o=2&f=c'

searchs.push new Search
    region:   'haute_normandie'
    location: 27000
    category_attrs:
        mrs:      600               # loyer min = 600
        mre:      1300              # loyer max = 1300
        sqs:      11                # surface min = 100m
        ret:      [1]               # type = maison
    category: 'locations'
    shouldbe: 'http://www.leboncoin.fr/locations/offres/haute_normandie/occasions/?mrs=600&mre=1300&sqs=11&ret=1&location=27000'

for search in searchs
    console.log "result:    #{do search.getUrl}"
    console.log "should be: #{search.options.shouldbe}"
    console.log ''
