# Description:
#   Commands to have Hubot help you debug Hubot
#
# Commands:
#   hubot dump <object> - Reply back with <object>

module.exports = (robot) ->
  robot.respond /DUMP (.*)$/i, (msg) ->
    msg.send JSON.stringify @[msg.match[1]]
    console.log msg.match[1]
    console.log robot[msg.match[1].replace '"','']
