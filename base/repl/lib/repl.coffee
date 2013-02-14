parser = require "./parser"
readline = require "readline"

# command loading
{ Api } = require "./../command/api"

class exports.ReplHelper
  @all_commands =
    api: Api

  constructor: ( @app ) ->

  initReadline: ( onCloseCb ) ->
    @rl = readline.createInterface
      input: process.stdin
      output: process.stdout

    @rl.on "close", onCloseCb

  runCommands: ( entered_commands, cb ) ->
    # get the initial highlevel command
    command = entered_commands.shift()

    # quit/exit are slightly magic
    return if command in [ "quit", "exit" ]

    if not @constructor.all_commands[ command ]?
      console.error "I don't know about '#{ command }'. Try 'help' instead."
      return @topLevelInput()

    # init the class
    command_object = new @constructor.all_commands[ command ]( @app )

    # the command exists, is there a method for it though?
    method = ( entered_commands.shift() or "help" )
    if not command_object[ method ]?
      console.error "'#{ command }' doesn't have a '#{ method }' method."
      return @topLevelInput()

    # run the method
    command_object[ method ]( entered_commands, cb )

  topLevelInput: ( err, info ) =>
    console.error err if err
    console.log info if info

    @rl.question "axle> ", ( entry ) =>
      console.error err if err

      entered_commands = parser entry

      @runCommands entered_commands, @topLevelInput
