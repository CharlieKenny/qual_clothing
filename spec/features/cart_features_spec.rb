require 'rails_helper'

feature 'shopping cart' do 
  scenario 'a user can add an item to the shopping cart' do 
    visit products_path
    page.find('#mens').click
    within("div#product_3.product") do
    click_button('Add to cart')
    end
    click_link('View Cart')
    expect(page).to have_content 'Leather Driver Saddle Loafers'    
  end

  scenario 'a user can remove an item from the shopping cart' do 
    visit products_path
    page.find('#mens').click
    within("div#product_3.product") do
    click_button('Add to cart')
    end
    click_link('View Cart')
    click_link('Remove')
    expect(page).to_not have_content 'Leather Driver Saddle Loafers'    
  end

  scenario 'a user can see the total cost of the items in their cart' do
    visit products_path
    page.find('#mens').click
    within("div#product_3.product") do
    click_button('Add to cart')
    click_button('Add to cart')
    end
    click_link('View Cart')
    expect(page).to have_content 'Total: £68.00'
  end

  scenario 'A user receives an error if trying to access an empty cart' do
    visit carts_path
    expect(page).to have_content "Your cart is empty, get shopping!"
  end

  scenario "A user can add a '£5.00 off your order' promocode" do
  visit products_path
    page.find('#mens').click
    within("div#product_3.product") do
    click_button('Add to cart')
    click_button('Add to cart')
    end
    click_link('View Cart')
    fill_in('cart_promocode', :with  => 'Promocode1')
    click_button('Apply')
    expect(page).to have_content 'Total: £63.00'
  end

  scenario "A user can add a '£10.00 off your £50+ order' promocode" do
  visit products_path
    page.find('#mens').click
    within("div#product_3.product") do
    click_button('Add to cart')
    click_button('Add to cart')
    end
    click_link('View Cart')
    fill_in('cart_promocode', :with  => 'Promocode2')
    click_button('Apply')
    expect(page).to have_content 'Total: £58.00'
  end

   scenario "A user can add a '£15.00 off a £75 spend including one item of footwear order' promocode" do
  visit products_path
    page.find('#womens').click
    within("div#product_2.product") do
      click_button('Add to cart')
    end
    within("div#product_13.product") do
      click_button('Add to cart')
    end
    click_link('View Cart')
    fill_in('cart_promocode', :with  => 'Promocode3')
    click_button('Apply')
    expect(page).to have_content 'Total: £567.00'
  end
end

