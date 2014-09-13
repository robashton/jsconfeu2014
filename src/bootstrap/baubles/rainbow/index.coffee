addRainbow = (container) ->
  child = document.createElement("div")
  child.className = "rainbow"
  container.appendChild(child)
  hookEvents child

hookEvents = (element) ->
  element.onclick = () ->
    if (element.className.indexOf 'selected') != -1
      element.className = 'rainbow'
    else
      element.className = 'rainbow selected'

window.rainbow = addRainbow
