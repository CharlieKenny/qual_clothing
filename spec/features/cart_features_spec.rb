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
    click_link('Remove from cart')
    expect(page).to_not have_content 'Leather Driver Saddle Loafers'    
  end
end

