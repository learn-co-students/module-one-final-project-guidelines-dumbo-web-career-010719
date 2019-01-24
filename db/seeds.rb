Creator.create(username: "joncher")
Creator.create(username: "leej")
Creator.create(username: "hashedpotato")

Game.create(title: "SSB", genre: "fight", platform: "Switch", solo_or_multi: "1P")
Game.create(title: "Mario Party", genre: "fight", platform: "Switch", solo_or_multi: "multi")
Game.create(title: "Cart", genre: "fight", platform: "Switch", solo_or_multi: "1P")
Game.create(title: "SSB", genre: "fight", platform: "Switch", solo_or_multi: "multi")

Player.create(username: 'joncher', location: "Queens", age: 25)
Player.create(username: 'leej', location: "Brooklyn", age: 49)
Player.create(username: 'rick', location: "Queens", age: 5)
Player.create(username: 'nate', location: "Manhattan", age: 21)


Community.create(location: "Albany", start_date: "01/23", title: "SSB")
Community.create(location: "Buffalo", start_date: "01/13",title: "SSB")
Community.create(location: "Albany", start_date: "12/30", title: "LOL")
Community.create(location: "Queens", start_date: "05/05",title: "WHAT")
Community.create(location: "Manhattan", start_date: "01/24", title: "SSB")

#
# League.create(name: "LCS", location: "NY", date: 20190123, title: "SSB")
# League.create(name: "aaa", location: "NY", date: 20000123, title: "SSB")
# League.create(name: "vwvw", location: "LA", date: 19641230, title: "LOL")
# League.create(name: "whakcd", location: "NY", date: 23000505, title: "WHAT")
# League.create(name: "oola", location: "LA", date: 20190123, title: "SSB")
