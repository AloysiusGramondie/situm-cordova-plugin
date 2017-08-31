var exec = require('cordova/exec');

var PLUGIN_NAME = 'Situm';

var Situm = {
  setApiKey: function (email, apiKey, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'setApiKey', [email, apiKey]);
  },
  setUserPass: function (email, apiKey, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'setUserPass', [email, password]);
  },
  startPositioning: function (arrBuilding, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'startPositioning', arrBuilding);
  },
  stopPositioning: function (cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'stopPositioning', []);
  },
  fetchBuildings: function (cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchBuildings', []);
  },
  fetchFloorsFromBuilding: function (building, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchFloorsFromBuilding', [building]);
  },
  fetchIndoorPOIsFromBuilding: function (building, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchIndoorPOIsFromBuilding', [building]);
  },
  fetchOutdoorPOIsFromBuilding: function (building, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchOutdoorPOIsFromBuilding', [building]);
  },
  fetchEventsFromBuilding: function (building, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchEventsFromBuilding', [building]);
  },
  fetchPoiCategories: function (cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchPoiCategories');
  },
  fetchMapFromFloor: function (floor, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchMapFromFloor', [floor]);
  },
  fetchPoiCategoryIconNormal: function (category, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchPoiCategoryIconNormal', [category]);
  },
  fetchPoiCategoryIconSelected: function (category, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'fetchPoiCategoryIconSelected', [category]);
  },
  invalidateCache: function (cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'invalidateCache');
  },
  requestDirections: function (pois, cb, error = null) {
    exec(cb, error, PLUGIN_NAME, 'requestDirections', pois);
  }
};
module.exports = Situm;
