require_relative '../config/environment'
require 'tty-prompt'

pid = fork{ exec 'afplay', "./sounds/Slow_Dance.mp3" }
banner
welcome
