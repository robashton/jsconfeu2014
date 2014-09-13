addCelestia = (container) ->
  child = document.createElement("div")
  child.className = "celestia"
  container.appendChild(child)
  hookEvents child

hookEvents = (element) ->
  element.onclick = () ->
    if (element.className.indexOf 'selected') != -1
      element.className = 'celestia'
    else
      element.className = 'celestia selected'

window.celestia = addCelestia
