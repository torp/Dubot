# Description:
#   Commands to have Hubot help you debug Hubot
#
# Commands:
#   hubot dump <object> - Reply back with <object>

stringify = require 'json-stringify-safe'

module.exports = (robot) ->
  robot.respond /DUMP (.*)$/i, (msg) ->
    if msg.match[1] is 'robot'
      console.log robot
    else
      msg.send stringify robot[msg.match[1]], null, 2
