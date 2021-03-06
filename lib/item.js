// Generated by CoffeeScript 1.7.1
(function() {
  var Item, cheerio, clean_string, request, url,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  cheerio = require('cheerio');

  request = require('request');

  url = require('url');

  clean_string = require('./utils').clean_string;

  Item = (function() {
    function Item(arg) {
      this.arg = arg;
      this.perform = __bind(this.perform, this);
      this.getPhoneNumber = __bind(this.getPhoneNumber, this);
      this.parseHTML = __bind(this.parseHTML, this);
      this.getUrl = __bind(this.getUrl, this);
      this.getUrl();
    }

    Item.prototype.getUrl = function() {
      var pathname;
      switch (typeof this.arg) {
        case 'number':
          this.item_id = this.arg;
          break;
        case 'object':
          if (this.arg.href != null) {
            this.url = this.arg.href;
          }
          break;
        case 'string':
          if (parseInt(this.arg).toString() === this.arg) {
            this.item_id = this.arg;
          } else if (/^http/.test(this.arg)) {
            this.url = this.arg;
          } else {
            throw new Error('Item parsing error');
          }
      }
      if (this.item_id) {
        this.url = "http://www.leboncoin.fr/locations/" + this.item_id + ".htm?ca=11_s";
      }
      if (this.url && !this.item_id) {
        pathname = url.parse(this.url).pathname;
        this.item_id = parseInt(pathname.split('/').reverse()[0].split('.htm')[0]);
      }
      return this.url;
    };

    Item.prototype.parseHTML = function(html) {
      var $, attrs, key, opts, row, thumb, value, _i, _j, _len, _len1, _ref, _ref1;
      attrs = {};
      opts = {
        normalizeWhitespace: true,
        decodeEntities: true
      };
      $ = cheerio.load(html, opts);
      _ref = $('.lbcParams > table > tr');
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        row = _ref[_i];
        key = clean_string($(row).find('th').html().replace(':', ' '));
        value = clean_string($(row).find('td').html());
        attrs[key] = value;
      }
      attrs.thumbs = [];
      _ref1 = $('#thumbs_carousel .thumbs_cadre span');
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        thumb = _ref1[_j];
        attrs.thumbs.push($(thumb).css('background-image').split("'")[1]);
      }
      attrs.description = clean_string($('.AdviewContent > .content').html());
      return attrs;
    };

    Item.prototype.getPhoneNumber = function(callback) {
      var opts;
      opts = {
        url: "http://www2.leboncoin.fr/ajapi/get/phone?list_id=" + this.item_id,
        json: true
      };
      return request(opts, (function(_this) {
        return function(error, response, data) {
          return callback(data != null ? data.phoneUrl : void 0);
        };
      })(this));
    };

    Item.prototype.perform = function(callback) {
      return request(this.url, (function(_this) {
        return function(error, response, html) {
          var attrs;
          attrs = _this.parseHTML(html);
          return callback({
            error: error,
            response: response,
            html: html,
            attrs: attrs
          });
        };
      })(this));
    };

    return Item;

  })();

  module.exports = Item;

}).call(this);
