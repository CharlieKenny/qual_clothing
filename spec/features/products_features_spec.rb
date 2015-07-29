require 'rails_helper'

feature 'homepage' do 
  scenario 'A user can choose what gender they want to buy for' do 
    visit '/products'
    expect(page).to have_content 'Men'
    expect(page).to have_content 'Women'
  end 

  scenario 'should display a navbar' do 
    visit '/products'
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Men\'s'
    expect(page).to have_content 'Women\'s'
    expect(page).to have_content 'Gift Vouchers'
  end

  context 'when clicking on gender to shop for' do
    scenario 'page should display list of relevant clothing items for men' do 
      visit '/products'
      page.find('#mens').click
      expect(page).to have_content "Leather Driver Saddle Loafers"
      expect(page).to have_content "Flip Flops"
    end

    scenario 'page should display list of relevant clothing items for women' do 
      visit '/products'
      page.find('#womens').click
      expect(page).to have_content "Almond Toe Court Shoes"
      expect(page).to have_content "Suede Shoes"
    end

    scenario 'should display men\'s clothing'do
      visit '/products'
      page.find('#mens').click
      expect(current_path).to have_content "/products/1/mens"
    end
  end
end

      # scenario 'should display a list of mens clothing items' do 