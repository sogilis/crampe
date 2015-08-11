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
    message.send 'http://i.imgur.com/DHTlPyD.jpg'
  robot.hear /prout/i, (msg) ->
  	name = msg.message.user.name
  	return unless name.match(/eric/i)
  	msg.send 'https://www.youtube.com/watch?v=TMTkedIUX8U'
