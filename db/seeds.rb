# Setup 4 essential collections
men = Collection.create(name:"men")
women = Collection.create(name:"women")
kids = Collection.create(name:"kids")
new = Collection.create(name:"new-ins")
# Base collection images are uploaded to S3
men.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'men.jpg')), 
                filename: 'men.jpg')
women.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'women.jpg')), 
                filename: 'women.jpg')
kids.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'kids.jpg')), 
                filename: 'kids.jpg')
new.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'collections', 'new.jpg')), 
                filename: 'new.jpg')

# Setup 1 Item
hoodie = Item.create(name:"Basic Hoodie",price:79.99)
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie.jpg')), 
                    filename: 'blue-hoodie.jpg')
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie-2.jpg')), 
                    filename: 'blue-hoodie-2.jpg')
hoodie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images' , 'items', 'blue-hoodie-3.jpg')), 
                    filename: 'blue-hoodie-3.jpg')

# Classifying item under collections                    
ItemCollection.create(collection_id:1,item_id:1)
ItemCollection.create(collection_id:2,item_id:1)

# RAD user
rad = User.new(
  username: 'RAD',
  email: 'rad2021rmit@gmail.com', 
  password: 'Rails2021', 
  password_confirmation: 'Rails2021'
)
rad.save!




