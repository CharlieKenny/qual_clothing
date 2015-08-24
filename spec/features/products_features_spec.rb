require 'rails_helper'

feature 'Products' do 
  scenario 'A user can choose what gender they want to buy for' do 
    visit products_path
    expect(page).to have_content 'Men'
    expect(page).to have_content 'Women'
  end 

  scenario 'should display a navbar' do 
    visit products_path
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Men\'s'
    expect(page).to have_content 'Women\'s'
    expect(page).to have_content 'View Cart'
  end

  context 'when clicking on gender to shop for' do
    scenario 'page should display list of relevant clothing items for men' do 
      visit products_path
      page.find('#mens').click
      expect(page).to have_content "Leather Driver Saddle Loafers"
      expect(page).to have_content "Flip Flops"
      expect(page).to have_content "£34.00"
      expect(page).to have_content "£19.00"
    end

    scenario 'page should display list of relevant clothing items for women' do 
      visit products_path
      page.find('#womens').click
      expect(page).to have_content "Almond Toe Court Shoes"
      expect(page).to have_content "Suede Shoes"
      expect(page).to have_content "£99.00"
      expect(page).to have_content "£42.00"
    end

    scenario 'should display men\'s clothing'do
      visit products_path
      page.find('#mens').click
      expect(current_path).to have_content "/mens/products"
    end

    scenario 'should display women\'s clothing'do
      visit products_path
      page.find('#womens').click
      expect(current_path).to have_content "/womens/products"
    end
  end
end
