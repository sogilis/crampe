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
    message.send 'http://i.imgur.com/v8rt6Pq.jpg'
  robot.hear /prout/i, (msg) ->
  	name = msg.message.user.name
  	return unless name.match(/eric/i)
  	msg.send 'http://i.imgur.com/v8rt6Pq.jpg'
