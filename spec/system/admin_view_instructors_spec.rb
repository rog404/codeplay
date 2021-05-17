require 'rails_helper'

describe 'Admin view instructors' do
  it 'successfully' do
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
        bio: 'Bacharel em Matematica')
    Instructor.create!(name: 'Tiago', email: 'tiago@email.com',
                   bio: 'Bacharel em Portugues')

    visit root_path
    click_on 'Instrutores'

    expect(page).to have_content('Rogerio')
    expect(page).to have_content('rogerio@email.com')
    expect(page).to have_content('Bacharel em Matematica')
  end

  it 'and view details' do
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
        bio: 'Bacharel em Matematica')
    Instructor.create!(name: 'Tiago', email: 'tiago@email.com',
                   bio: 'Bacharel em Portugues')


    visit root_path
    click_on 'Instrutores'
    click_on 'Tiago'

    expect(page).to have_content('Tiago')
    expect(page).to have_content('tiago@email.com')
    expect(page).to have_content('Bacharel em Portugues')
  end

  it 'and no instructor is available' do
    visit root_path
    click_on 'Instrutores'

    expect(page).to have_content('Nenhum instrutor disponível')
  end

  it 'and return to home page' do
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
        bio: 'Bacharel em Matematica')

    visit root_path
    click_on 'Instrutores'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  it 'and return to promotions page' do
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
        bio: 'Bacharel em Matematica')

    visit root_path
    click_on 'Instrutores'
    click_on 'Rogerio'
    click_on 'Voltar'

    expect(current_path).to eq instructors_path
  end
end
