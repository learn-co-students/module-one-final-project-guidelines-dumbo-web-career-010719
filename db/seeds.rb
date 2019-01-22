require 'pry'
require 'rest-client'

response_string = RestClient.get("http://www.omdbapi.com/?s=Batman&page=3&apikey=c4d80531")
#http://www.omdbapi.com/?i=tt3896198&apikey=c4d80531
#http://www.omdbapi.com/?apikey=[yourkey]&
#type
#http://www.omdbapi.com/?page=1
response_hash = JSON.parse(response_string)
binding.pry
