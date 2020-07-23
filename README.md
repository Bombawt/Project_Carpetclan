# Project Carpetclan

We were tasked to build an app over the course of a week, which allows a shopkeeper to track their shop’s inventory. This was not to be an app which the customer would see, it was to be designed as an admin/management app for the shop workers.

## MVP Requirements

- The inventory should track individual products, including a name, description, stock quantity, buying cost, and selling price.
- The inventory should track manufacturers, including a name and any other appropriate details.
- The shop can sell anything you like, but you should be able to create and edit manufacturers and products separately.
- This might mean that it makes more sense for a car shop to track makes and models of cars. Or a bookstore might sell books by author, or by publisher, and not by manufacturer. You are free to name classes and tables as appropriate to your project.
- Show an inventory page, listing all the details for all the products in stock in a single view.
- As well as showing stock quantity as a number, the app should visually highlight “low stock” and “out of stock” items to the user.


## Setup

```
- Ruby
- Sinatra
- Postgres SQL
- Pry-byebug
- Minitest

Will all be required, and can be installed via gem.
```

## Install

First clone the repository from Github, then navigate to the downloaded folder via Terminal. Within that folder, paste the following into Terminal: 

Create the database 
```
createdb carpet_shop
```

Create the database structure
```
psql -d carpet_shop -f db/carpet_shop.sql
```

Seed the database
```
ruby db/seeds.rb
```

Start the app
```
ruby app.rb
```

Open a new browser page, and paste the following into the address bar:
```
http://localhost:4567/
```

