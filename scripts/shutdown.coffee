# Description:
#   Shutdown Hubot Gracefully
#

module.exports = (robot) ->
  status =
    brain: true
    adapter: true

  checkStatus = (status) ->
    check = true
    for i of status
      check = false if status[i]
    die() if check

  die = () ->
    console.log('Exiting...')
    process.exit 0

  robot.brain.on 'close', (event) ->
    status.brain = false
    checkStatus(status)

  robot.adapter.on 'close', (event) ->
    status.adapter = false
    checkStatus(status)

  robot.respond /DIE$/i, (msg) ->
    if robot.auth.isAdmin msg.message.user
      msg.send "Goodbye, cruel world."
      robot.shutdown()
    else
      msg.send "OH HELL NAW!!!"
