// Generated by CoffeeScript 1.7.1
(function() {
  var XmlEntities, entities;

  XmlEntities = require('html-entities').XmlEntities;

  if (!String.prototype.trim) {
    String.prototype.trim = function() {
      return this.replace(/^\s+|\s+$/g, "");
    };
  }

  String.prototype.strip = function() {
    if (String.prototype.trim != null) {
      return this.trim();
    } else {
      return this.replace(/^\s+|\s+$/g, "");
    }
  };

  String.prototype.lstrip = function() {
    return this.replace(/^\s+/g, "");
  };

  String.prototype.rstrip = function() {
    return this.replace(/\s+$/g, "");
  };

  entities = new XmlEntities();

  module.exports.clean_string = function(input) {
    var output;
    output = input.replace(/[\n\t\ ]+/g, ' ').replace('&nbsp;', ' ').replace('&euro;', 'E').replace(/<script.*?>.*?<\/script>/gim, '').replace(/<[^>]*>/g, '').strip();
    output = entities.decode(output);
    return output;
  };

}).call(this);
