# Description:
#   Hoffme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot hoff me - Receive a hasselhoff
#   hubot hoff bomb N - get N hasselhoffs

module.exports = (robot) ->

  robot.respond /hoff me/i, (msg) ->
    imageMe msg, 'hasselhoff', (url) ->
      msg.send url

  robot.respond /hoff bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    for n in [1..count]
      imageMe msg, 'hasselhoff', (url) ->
        msg.send url

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"