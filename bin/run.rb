require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'
require_relative './menu'
require 'audite'

Menu.intro_music
Menu.game_music
Menu.main_menu