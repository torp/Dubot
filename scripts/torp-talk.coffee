# Description:
#   General Torp Sayings
#


module.exports = (robot) ->
  robot.hear /ttmf/gi, (msg) ->
    msg.send "TTMF!!!"

  robot.hear /wee/gi, (msg) ->
    msg.send "wee"
    setTimeout ->
      msg.send "wee"
      setTimeout ->
        msg.send "weeeeeeeeee!"
      , 800
    , 800
