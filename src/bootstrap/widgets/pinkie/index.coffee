addPinkie = (container) ->
  child = document.createElement("div")
  child.className = "pinkie"
  container.appendChild(child)
  hookEvents child

hookEvents = (element) ->
  element.onclick = () ->
    if (element.className.indexOf 'selected') != -1
      element.className = 'pinkie'
    else
      element.className = 'pinkie selected'

window.pinkie = addPinkie
