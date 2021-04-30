require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show the message of welcome' do
    visit(root_path)
    expect(page).to have_content('Welcome') 
  end

  scenario 'Verify link register client' do 
    visit(root_path)
    expect(find('ul li')).to have_link('New Client')
  end
end
