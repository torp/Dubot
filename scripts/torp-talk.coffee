# Description:
#   General Torp Sayings
#


module.exports = (robot) ->
  robot.hear /TTMF$/i, (msg) ->
    msg.send "TTMF!!!"

  robot.hear /WEE$/i, (msg) ->
    msg.send "wee"
    setTimeout ->
      msg.send "wee"
      setTimeout ->
        msg.send "weeeeeeeeee!"
      , 800
    , 800
