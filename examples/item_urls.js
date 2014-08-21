// Generated by CoffeeScript 1.7.1
(function() {
  var Item, entries, entry, item, _i, _len;

  process.stdout.write('\u001B[2J\u001B[0;0f');

  Item = require('..').Item;

  entries = [];

  entries.push({
    argument: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s",
    shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
  });

  entries.push({
    argument: "696514990",
    shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
  });

  entries.push({
    argument: 696514990,
    shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
  });

  entries.push({
    argument: {
      'href': "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
    },
    shouldbe: "http://www.leboncoin.fr/locations/696514990.htm?ca=11_s"
  });

  for (_i = 0, _len = entries.length; _i < _len; _i++) {
    entry = entries[_i];
    item = new Item(entry.argument);
    console.log("result:    " + (item.getUrl()));
    console.log("should be: " + entry.shouldbe);
    console.log('');
  }

}).call(this);
