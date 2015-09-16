# Description:
#   (tgb)
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
#   Marien

module.exports = (robot)->
  robot.hear /\(tgb\)/, (message) ->
    message.send 'http://i.imgur.com/FE5y8nd.jpg'
