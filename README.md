[![Build Status](https://travis-ci.org/CharlieKenny/qual_clothing.png)](https://travis-ci.org/CharlieKenny/qual_clothing)  [![Code Climate](https://codeclimate.com/github/CharlieKenny/qual_clothing/badges/gpa.svg)](https://codeclimate.com/github/CharlieKenny/qual_clothing)

# QualClothing

Brief
-----

To develop a responsive e-commerce site for a clothes retailer fulfilling the following user stories:

```
As a user, I can view the products and their category, price and availability information.

As a user I can add a product to my shopping cart

As a user I can remove a product from my shopping cart

As a user I can view the total price for the products in my shopping cart

As a user I can apply a voucher to my shopping cart

As a user I can view the total price for the products in my shopping cart with discounts applied

As a user I am alerted when I apply an invalid voucher to my shopping cart

As a user I am unable to add 'out of stock' products to my shopping cart
```

Technologies
------------

* Developed in Ruby on Rails
* Tested with Rspec and Capybara
* Styled with Bootstrap

Approach
--------
This app contains 4 pages: 
A landing page, whereby users can easily navigate to different departments, organised by gender.
A men's product page
A women's product page
A checkout page where users can view their cart total and apply promocodes, if applicable.

The app contains two models and controllers for the Cart and Products. For simplicity I haven't included any session functionality as it wasn't required in order to fulfil the user stories. 

The vouchers did pose a bit of a conundrum and I wanted to store them as a flat file rather than have them stored in the DB. I originally thought my way would be simple but it came with its own difficulties. In future iterations I would create a Promocode/Discounts model and store the info in the DB for increased flexibility.

I hope you enjoy the stock imagery as much as I do.

![alt text](link "Screenshot")

Set-up and Use
------
The following steps rely on the assumption you have Ruby installed, if that's not the case please follow [this](https://rvm.io/rubies/installing)tutorial to get up and running.

To run the site in your browser please follow these steps in your terminal:

- ``` git clone https://github.com/charliekenny/qual_clothing```
- ``` cd qual_clothing ```
- ``` bundle ```
- ``` bin/rake db:create ``` 
- ``` bin/rake db:migrate ```
- ``` bin/rails server ```
- Visit [http://localhost:3000](http://localhost:3000)
- Use ``` rspec ``` to run the tests
- Use ```"Promocode1" ``` for the £5 off promocode
- Use ```"Promocode2" ``` for the £10 off a £50 spend promocode
- Use ```"Promocode3" ``` for the £15 off a £75 spend when also buying a pair of shoes promocode
