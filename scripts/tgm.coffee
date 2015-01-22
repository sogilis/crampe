# Description:
#   (tgm)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   Eunomie

module.exports = (robot)->
  robot.hear /\(tgm\)/, (message) ->
    message.send 'https://thomashunter.name/batman-comic/gen/20150122093349_54c10a4d71952.jpg'
