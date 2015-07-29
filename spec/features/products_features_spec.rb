require 'rails_helper'

feature 'homepage' do 
  scenario 'A user can choose what gender they want to buy for' do 
    visit '/products'
    expect(page).to have_content 'Male'
    expect(page).to have_content 'Female'
  end 

  scenario 'should display a navbar' do 
    visit '/products'
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Men\'s'
    expect(page).to have_content 'Women\'s'
    expect(page).to have_content 'Gift Vouchers'
  end

  context 'when clicking on gender to shop for' do
    scenario 'page should display list of relevant clothing items' do 
      visit '/products'
      expect(page).to have_content 'Home'
      expect(page).to have_content 'Men\'s'
      expect(page).to have_content 'Women\'s'
      expect(page).to have_content 'Gift Vouchers'
    end

    scenario 'should display men\'s clothing'do
      visit '/products'
      page.find('#mens').click
      expect(current_path).to have_content "/products/1/male"
    end
  end
end

      # scenario 'should display a list of mens clothing items' do 