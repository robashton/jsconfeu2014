addCelestia = (container) ->
  container.append '<div class="celestia"></div>'
  celestia = container.querySelector '.celestia'
  hookEvents celestia

hookEvents = (element) ->
  if element.className.indexOf 'selected'
    element.className = 'celestia'
  else
    element.className = 'celestia selected'

window.celestia = addCelestia
