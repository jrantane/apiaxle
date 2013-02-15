_ = require "underscore"
{ ModelCommand } = require "../command"

class exports.Key extends ModelCommand
  @modelName = "keyFactory"

  _postProcessOptions: ( commands ) ->
    if commands.forApis?
      commands.forApis = commands.forApis.split /\s*,\s*/

    return commands

  help: ( commands, cb ) ->
    help = "key [find|update|delete] <id>\n\n"
    help += "key create <id>\nFields supported:\n"
    help += @model().getValidationDocs()

    return cb null, help
