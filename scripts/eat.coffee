# Description:
#   Where to eat?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   O(ù|u) manger ce midi ?
#
# Author:
#   Eunomie


restaurants = [
   name: "Le barbecue de Damas"
   food_type: "syrien"
   addr: "45 Cours Berriat 38000 Grenoble"
   livraison: false
   emporte: true
   surplace: true
  ,
   name: "Sushi one Grenoble"
   food_type: "sushi"
   addr: "28 Avenue Félix Viallet 38000 Grenoble"
   livraison: true
   emporte: true
   surplace: false
  ,
   name: "Gros mac"
   addr: "1 Place de la Gare 38000 Grenoble"
   food_type: "hamburger"
   livraison: false
   emporte: true
   surplace: true
  ,
   name: "Burger Fernand"
   addr: "124 Cours Berriat 38000 Grenoble"
   food_type: "hamburger"
   livraison: false
   emporte: true
   surplace: true
  ,
   name: "Emile"
   addr: "place Firmin Gautier 38000 Grenoble"
   food_type: "resto midi"
   livraison: false
   emporte: false
   surplace: false
  ,
   name: "O'Naan"
   addr: "83 Cours Berriat 38000 Grenoble"
   food_type: "indien"
   livraison: false
   emporte: true
   surplace: true
  ,
   name: "Mei Shan"
   addr: "42 Avenue Alsace Lorraine 38000 Grenoble"
   food_type: "chinois"
   livraison: false
   emporte: false
   surplace: true
  ,
   name: "Le jasmin"
   addr: "73 Cours Berriat 38000 Grenoble"
   food_type: "chinois"
   livraison: false
   emporte: true
   surplace: true
]

module.exports = (robot) ->
  robot.respond /o[ùu] manger ce midi ?/i, (msg) ->
    place = msg.random restaurants
    say_where_to_eat place, msg
  robot.respond /o[ùu] manger (.+) ce midi ?/i, (msg) ->
    type = msg.match[1]
    places = []
    places.push(place) for place in restaurants when place.food_type is type
    place = msg.random places
    say_where_to_eat place, msg

say_where_to_eat = (place, msg)->
    msg.send "Vous pouvez manger au #{place.name} (#{place.food_type})"
    msg.send "Vous pouvez vous faire livrer" if place.livraison
    msg.send "Vous pouvez emporter" if place.emporte
    msg.send "Vous pouvez manger sur place" if place.surplace
    send_map place.addr, message

send_map = (location, msg)->
  mapType  = "roadmap"
  mapUrl   = "http://maps.google.com/maps/api/staticmap?markers=" +
              escape(location) +
              "&size=400x400&maptype=" +
              mapType +
              "&sensor=false" +
              "&format=png" # So campfire knows it's an image
  url      = "http://maps.google.com/maps?q=" +
             escape(location) +
            "&hl=en&sll=37.0625,-95.677068&sspn=73.579623,100.371094&vpsrc=0&hnear=" +
            escape(location) +
            "&t=m&z=11"
  msg.send mapUrl
  msg.send url
