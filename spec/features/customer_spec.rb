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
    expect(page).to have_content('Novo Cliente')
  end

  scenario 'Register new Client' do 
    customer_name = Faker::Name.name
    visit(new_customer_path)
    fill_in "Nome",	with: customer_name
    fill_in "Email",	with: Faker::Internet.email 
    fill_in "Telefone",	with: Faker::PhoneNumber.phone_number
    attach_file "Foto do Perfil", "#{Rails.root}/spec/fixtures/avatar.png" 
    choose(option: ['S','N'].sample)
    click_on('Salvar Cliente')
    expect(page).to have_content('Client registered success')
    expect(Customer.last.name).to eq(customer_name) 
  end
end
