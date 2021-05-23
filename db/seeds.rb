# Setup 4 essential collections
men = Collection.create(name:"men")
women = Collection.create(name:"women")
kids = Collection.create(name:"kids")
new = Collection.create(name:"new-ins")

men.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'men.jpg')), 
                filename: 'men.jpg')
women.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'women.jpg')), 
                filename: 'women.jpg')
kids.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'kids.jpg')), 
                filename: 'kids.jpg')
new.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'new.jpg')), 
                filename: 'new.jpg')


# Colours model setup with 6 colours
white = Colour.create(name:"alabaster white",colour_code:"F4EBD9")
black = Colour.create(name:"jet black",colour_code:"2D2D2A")
red = Colour.create(name:"indian red",colour_code:"D56062")
blue = Colour.create(name:"star command blue",colour_code:"067BC2")
yellow = Colour.create(name:"jonquil yellow",colour_code:"ECC30B")
orange = Colour.create(name:"mandarin orange",colour_code:"F37748")

# Sizes
xs = Size.create(name:"extra small",label:"XS")
s = Size.create(name:"small",label:"S")
m = Size.create(name:"medium",label:"M")
l = Size.create(name:"large",label:"L")
xl = Size.create(name:"extra large",label:"XL")


# Setup Items
hoodie = Item.create(name:"Basic Hoodie", price:69.99, colours: [black, blue, yellow, orange], collections: [men, women],
                    sizes: [s,m,l])
                    
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie.jpg')), 
                    filename: 'blue-hoodie.jpg')
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie-2.jpg')), 
                    filename: 'blue-hoodie-2.jpg')
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie-3.jpg')), 
                    filename: 'blue-hoodie-3.jpg')


dress = Item.create(name:"Centerfold Shirt Dress", price:79.99, colours: [black, red, blue, orange], collections: [women],
                    sizes: [xs,s,m])
                    
dress.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'shirt-dress.jpg')), 
                    filename: 'shirt-dress.jpg')
dress.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'shirt-dress-2.jpg')), 
                    filename: 'shirt-dress-2.jpg')
dress.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'shirt-dress-3.jpg')), 
                    filename: 'shirt-dress-3.jpg')


zippy = Item.create(name:"All-in-One Fleece Zippy", price:39.99, colours: [white, blue, orange], collections: [kids],
                    sizes: [s,m,l])
                    
zippy.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'fleece-zippy.jpg')), 
                    filename: 'fleece-zippy.jpg')
zippy.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'fleece-zippy-2.jpg')), 
                    filename: 'fleece-zippy-2.jpg')
zippy.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'fleece-zippy-3.jpg')), 
                    filename: 'fleece-zippy-3.jpg')
     
                    
striped = Item.create(name:"Oversized Striped Shirt", price:89.99, colours: [black, white], collections: [men, women],
                    sizes: [m,l,xl])
                    
striped.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'oversized-stripe.jpg')), 
                    filename: 'oversized-stripe.jpg')
striped.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'oversized-stripe-2.jpg')), 
                    filename: 'oversized-stripe-2.jpg')
striped.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'oversized-stripe-3.jpg')), 
                    filename: 'oversized-stripe-3.jpg')


# Older product
jacket = Item.create(name:"Cabin Jacket", price:299.99, created_at: 5.month.ago , colours: [yellow, blue, orange], collections: [men],
                    sizes: [s,m,xl])
                    
jacket.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'cabin-jacket.jpg')), 
                    filename: 'cabin-jacket.jpg')
jacket.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'cabin-jacket-2.jpg')), 
                    filename: 'cabin-jacket-2.jpg')
jacket.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'cabin-jacket-3.jpg')), 
                    filename: 'cabin-jacket-3.jpg')

# RAD user
rad = User.new(
  username: 'RAD',
  email: 'rad2021rmit@gmail.com', 
  password: 'Rails2021', 
  password_confirmation: 'Rails2021'
)
rad.save!

admin = User.new(
  username: 'admin',
  email: 'admin@raindrops.com', 
  password: 'password', 
  password_confirmation: 'password',
  admin: true
)
admin.save!

