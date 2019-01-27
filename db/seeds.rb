require_all 'app'


ched = Item.create(name: "Cheddar", quantity: 25)
rib = Item.create(name: "Ribeye", quantity: 25)
mush = Item.create(name: "Mushrooms", quantity: 25)
tris = Item.create(name: "Triscuits", quantity: 25)
milk = Item.create(name: "Milk", quantity: 25)
eggs = Item.create(name: "Eggs", quantity: 25)
cake = Item.create(name: "Cake", quantity: 25)
frost = Item.create(name: "Frosted flakes", quantity: 25)
alm = Item.create(name: "Almonds", quantity: 25)
bread = Item.create(name: "Bread", quantity: 25)
turk = Item.create(name: "Turkey", quantity: 25)
mash = Item.create(name: "Mashed potatoes", quantity: 25)
asp = Item.create(name: "Asparagus", quantity: 25)
hum = Item.create(name: "Hummus", quantity: 25)
dor = Item.create(name: "Doritos", quantity: 25)
sco = Item.create(name: "Sour cream and onion chips", quantity: 25)
so = Item.create(name: "Sour cream", quantity: 25)
bl = Item.create(name: "Black beans", quantity: 25)
corn = Item.create(name: "Corn", quantity: 25)
pickles = Item.create(name: "Pickles", quantity: 25)

pub = Store.create(name: "Publix", location: 11226)
key = Store.create(name: "Key Food", location: 11223)
wal = Store.create(name: "Walmart", location: 11226)
fair = Store.create(name: "Fairway", location: 11223)
pio = Store.create(name: "Pioneer", location: 11226)

pub.items << ched
pub.items << rib
pub.items << mush
pub.items << tris

key.items << milk
key.items << eggs
key.items << cake
key.items << frost

wal.items << alm
wal.items << bread
wal.items << turk
wal.items << mash

fair.items << asp
fair.items << hum
fair.items << dor
fair.items << sco

pio.items << so
pio.items << bl
pio.items << corn
pio.items << pickles
