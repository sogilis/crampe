# Description:
#   CSP Limoges is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot csp me - Receive a csp
#   hubot csp bomb N - get N csp

module.exports = (robot) ->

  robot.respond /csp me/i, (msg) ->
    imageMe msg, 'csp limoges'

  robot.respond /csp bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    count = 8 if count > 8
    bombMe msg, 'csp limoges', count

imageMe = (msg, query) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'off'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        msg.send "#{image.unescapedUrl}#.png"

bombMe = (msg, query, count) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'off'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        for n in [1..count]
          image = msg.random images
          msg.send "#{image.unescapedUrl}#.png"
          images.splice images.indexOf(image), 1
