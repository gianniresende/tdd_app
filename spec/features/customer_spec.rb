require 'rails_helper'

feature "Customers", type: :feature do
  scenario 'Verify link register client' do 
    visit(root_path)
    expect(page).to have_link('New Client')
  end

  scenario 'Verify link of new client' do 
    visit(root_path)
    click_on('New Client')
    expect(page).to have_content('Listing Client')
    expect(page).to have_link('New Client')
  end

  scenario 'Verify form new client' do 
    visit(customers_path)
    click_on('New Client')
    expect(page).to have_content('New Client')
  end
end
