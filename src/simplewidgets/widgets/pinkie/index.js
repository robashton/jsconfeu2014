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
