# Version.coffee 
#
# Description:
# Grabs various system and node module verions
#
# Commands:
#   hubot version - responds with Dubot's version
#   hubot node version - responds with the version of node that Dubot is running on
#   hubot Hubot version - responds with the version of Hubot that is Dubot's core.

child = require('child_process')
path = require('path')

module.exports = (robot) ->

  robot.respond /VERSION$/i, (msg) ->
    msg.send 'Dubot ' + require(path.resolve('.') + '/package.json').version

  robot.respond /NODE VERSION$/i, (msg) ->
    msg.send 'Node ' + process.version

  robot.respond /HUBOT VERSION$|DUBOT VERSOIN$/i, (msg) ->
    msg.send 'Hubot ' + require(path.resolve('./node_modules/hubot') + '/package.json').version
