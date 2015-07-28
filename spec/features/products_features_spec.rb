require 'rails_helper'

feature 'homepage' do 
  context 'A user can choose what gender they want to buy for and see a list of related items' do
    scenario 'should display a list of mens clothing items' do 
      visit '/products'
      expect(page).to have_content 'Male'
      expect(page).to have_content 'Female'
    end
  end

    scenario 'should display a navbar' do 
      visit '/products'
      expect(page).to have_content 'Home'
      expect(page).to have_content 'Men\'s'
      expect(page).to have_content 'Women\'s'
      expect(page).to have_content 'Gift Vouchers'
    end
end

      # scenario 'should display a list of mens clothing items' do 