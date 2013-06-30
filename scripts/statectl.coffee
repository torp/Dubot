# Description:
#   Control Hubot Power States Gracefully
#

module.exports = (robot) ->
  status =
    brain: true
    adapter: true
  rebootCheck = false

  die = ->
    console.log 'Exiting...'
    process.send {command:'poweroff'}

  reboot = ->
    console.log 'Rebooting Dubot...'
    process.send {command:'reboot'}

  checkStatus = (status) ->
    check = true
    for i of status
      check = false if status[i]
    if check
      if rebootCheck
        reboot()
      else
        die()

  robot.brain.on 'close', (event) ->
    status.brain = false
    console.log('brain closed')
    checkStatus(status)

  robot.adapter.on 'close', (event) ->
    status.adapter = false
    console.log('irc closed')
    checkStatus(status)

  robot.respond /POWEROFF$|DIE$/i, (msg) ->
    if robot.auth.isAdmin msg.message.user
      msg.send "Goodbye, cruel world."
      robot.shutdown()
    else
      msg.send "OH HELL NAW!!!"

  robot.respond /REBOOT$/i, (msg) ->
    if robot.auth.isAdmin msg.message.user
      msg.send "Cool, BRB..."
      rebootCheck = true
      robot.shutdown()
    else
      msg.send "OH HELL NAW!!!"
