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
#
# Author:
#   Eunomie

activated_users =
  Shanti: true
  #Yves: true

module.exports = (robot)->
  robot.brain.userForMentionName = (nick)->
    for k of (@data.users or { })
      return @data.users[k] if @data.users[k]['mention_name'] is nick
    null
    
  robot.hear /([\w.\-]+: )?(.*@([\w.\-]+)\b.*)/, (message)->
    nick = message.match[3].trim()
    return unless nick of activated_users
    user = robot.brain.userForMentionName nick
    message.send "#{user.name}: #{message.match[2]}" if user

  robot.hear /([\w .\-]+): (.*)/, (message)->
    name = message.match[1].trim()
    user = robot.brain.userForName name
    return unless message.envelope.user.mention_name of activated_users
    message.send "@#{user.mention_name} #{message.match[2]}" if user
