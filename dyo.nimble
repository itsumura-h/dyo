# Package

version       = "0.1.0"
author        = "dyo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["www"]

backend       = "js"

# Dependencies

requires "nim >= 1.0.4"
requires "cligen >= 0.9.42"
requires "karax >= 1.1.0"
