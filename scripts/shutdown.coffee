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
   process.exit 0

  robot.on 'close', () ->
    status.brain = false
    checkStatus(status)

  robot.on 'adapterClose', () ->
    status.adapter = false
    checkStatus(status)

