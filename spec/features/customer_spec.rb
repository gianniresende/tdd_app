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

  scenario 'Not sregister client at blank' do
    visit(new_customer_path)
    click_on('Salvar Cliente')
    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'Show client' do 
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S','N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )  

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
  end

  scenario 'Test index client' do 
    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S','N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )  

    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S','N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  scenario 'Update one Client' do 
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S','N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    ) 

    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in "Nome",	with: new_name 
    click_on('Update Client')

    expect(page).to have_content('Cliente atualizado com sucesso!')
    expect(page).to have_content(new_name)
  end

  scenario 'Click link to show' do  
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S','N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr/td[4]/a").click

    expect(page).to have_content('Mostrando Cliente')
  end
end
