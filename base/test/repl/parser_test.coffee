{ TwerpTest } = require "twerp"
parser = require "../../repl/lib/parser"

class exports.TestParser extends TwerpTest
  "test the parser": ( done ) ->
    shoulds =
      # double quotes
      'This is a "test parse"': [ "This", "is", "a", "test parse" ]

      # single quotes
      "This is a 'test parse'": [ "This", "is", "a", "test parse" ]

      # numbers
      '1 2 3 4': [ 1, 2, 3, 4 ]

      # option=string
      'api create facebook "endPoint"="graph"': [ "api", "create", "facebook", { endPoint: "graph" } ]

      # option=string and number arg mix
      '"str" key=value 123': [ "str", { key: "value" }, 123 ]

      # key creation
      "key create forApis='facebook'": [ "key", "create", { forApis: "facebook" } ]

    @deepEqual parser( from ), to for from, to of shoulds

    done 6
