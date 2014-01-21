# Description:
#   Convert hipchat mentions to jabber with real name.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @... - "Full Name:"
#
# Author:
#   Eunomie

activated_users =
  Shanti: true

module.exports = (robot)->
  robot.hear /([\w.\-]+: )?(.*@([\w.\-]+)\b.*)/, (message)->
    nick = message.match[3].trim()
    if nick of activated_users
      users = robot.brain.usersForFuzzyName nick
      if users.length is 1
        user = users[0]
        message.send "#{user.name}: #{message.match[2]}"
