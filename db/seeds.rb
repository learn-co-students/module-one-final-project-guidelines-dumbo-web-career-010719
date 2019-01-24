Creator.create(username: "joncher")
Creator.create(username: "leej")
Creator.create(username: "hashedpotato")

Game.create(title: "Super_Smash_Brothers_Ultimate", genre: "fight", platform: "Switch", solo_or_multi: "1P")
Game.create(title: "Fortnite", genre: "fight", platform: "Switch", solo_or_multi: "multi")
Game.create(title: "Call_of_Duty", genre: "fight", platform: "PS4", solo_or_multi: "1P")
Game.create(title: "Overwatch", genre: "fight", platform: "PC", solo_or_multi: "multi")
Game.create(title: "Battlefield_5", genre: "fight", platform: "XBOX", solo_or_multi: "multi")
Game.create(title: "League_of_Legends", genre: "fight", platform: "PC", solo_or_multi: "multi")




Player.create(username: 'joncher', location: "Queens", age: 25)
Player.create(username: 'leej', location: "Brooklyn", age: 49)
Player.create(username: 'rick', location: "Queens", age: 5)
Player.create(username: 'nate', location: "Manhattan", age: 21)


Community.create(location: "Albany", start_date: "01/23", title: "Super_Smash_Brothers_Ultimate")
Community.create(location: "Buffalo", start_date: "01/13",title: "SSuper_Smash_Brothers_Ultimate")
Community.create(location: "Albany", start_date: "12/30", title: "League_of_Legends")
Community.create(location: "Queens", start_date: "05/05",title: "Call_of_Duty")
Community.create(location: "Manhattan", start_date: "01/24", title: "Super_Smash_Brothers_Ultimate")

#
# League.create(name: "LCS", location: "NY", date: 20190123, title: "SSB")
# League.create(name: "aaa", location: "NY", date: 20000123, title: "SSB")
# League.create(name: "vwvw", location: "LA", date: 19641230, title: "LOL")
# League.create(name: "whakcd", location: "NY", date: 23000505, title: "WHAT")
# League.create(name: "oola", location: "LA", date: 20190123, title: "SSB")
