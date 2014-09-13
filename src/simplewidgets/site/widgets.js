// Generated by CoffeeScript 1.8.0
(function() {
  var addCelestia, hookEvents;

  addCelestia = function(container) {
    var child;
    child = document.createElement("div");
    child.className = "celestia";
    container.appendChild(child);
    return hookEvents(child);
  };

  hookEvents = function(element) {
    return element.onclick = function() {
      if ((element.className.indexOf('selected')) !== -1) {
        return element.className = 'celestia';
      } else {
        return element.className = 'celestia selected';
      }
    };
  };

  window.celestia = addCelestia;

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  var addPinkie, hookEvents;

  addPinkie = function(container) {
    var child;
    child = document.createElement("div");
    child.className = "pinkie";
    container.appendChild(child);
    return hookEvents(child);
  };

  hookEvents = function(element) {
    return element.onclick = function() {
      if ((element.className.indexOf('selected')) !== -1) {
        return element.className = 'pinkie';
      } else {
        return element.className = 'pinkie selected';
      }
    };
  };

  window.pinkie = addPinkie;

}).call(this);
// Generated by CoffeeScript 1.8.0
(function() {
  var addRainbow, hookEvents;

  addRainbow = function(container) {
    var child;
    child = document.createElement("div");
    child.className = "rainbow";
    container.appendChild(child);
    return hookEvents(child);
  };

  hookEvents = function(element) {
    return element.onclick = function() {
      if ((element.className.indexOf('selected')) !== -1) {
        return element.className = 'rainbow';
      } else {
        return element.className = 'rainbow selected';
      }
    };
  };

  window.rainbow = addRainbow;

}).call(this);
