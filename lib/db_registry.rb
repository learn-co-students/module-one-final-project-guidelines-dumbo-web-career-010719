require 'ostruct'
require_relative "./connection_adapter"

DBRegistry ||= OpenStruct.new(test: ConnectionAdapter.new("db/char_inv-test.db"), 
  development: ConnectionAdapter.new("db/char_inv-development.db"), 
  production: ConnectionAdapter.new("db/char_inv-production.db")
  )
