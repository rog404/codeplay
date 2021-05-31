require 'rails_helper'

describe 'Admin registers instructor' do
  it 'from index page' do
    user = User.create!(email: 'jane@test.com.br', password: '123456')
    login_as user, scope: :user
    visit root_path
    click_on 'Instrutores'

    expect(page).to have_link('Registrar um Instrutor',
                              href: new_instructor_path)
  end

  it 'successfully' do
    user = User.create!(email: 'jane@test.com.br', password: '123456')
    login_as user, scope: :user
    visit root_path
    click_on 'Instrutor'
    click_on 'Registrar um Instrutor'

    fill_in 'Nome', with: 'Rogerio'
    fill_in 'Email', with: 'rogerio@email.com'
    fill_in 'Bio', with: 'Bacharel em Matemática'
    click_on 'Criar Instrutor'

    expect(current_path).to eq(instructor_path(Instructor.last))
    expect(page).to have_content('Rogerio')
    expect(page).to have_content('rogerio@email.com')
    expect(page).to have_content('Bacharel em Matemática')
    expect(page).to have_link('Voltar')
  end
end
