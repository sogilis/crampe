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
    message.send 'https://thomashunter.name/batman-comic/gen/20150429054047_5540a71f3aca3.jpg'
  robot.hear /prout/i, (msg) ->
  	name = msg.message.user.name
  	return unless name.match(/eric/i)
  	msg.send 'https://thomashunter.name/batman-comic/gen/20150429054047_5540a71f3aca3.jpg'
