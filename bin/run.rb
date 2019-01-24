require_relative '../config/environment'
require 'tty-prompt'
require 'pry'

pid = fork{ exec 'afplay', "./sounds/Slow_Dance.mp3" }
banner
welcome
