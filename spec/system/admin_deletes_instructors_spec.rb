require 'rails_helper'

describe 'Admin deletes instructors' do
  xit 'successfully' do
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
        bio: 'Bacharel em Matematica')
    Instructor.create!(name: 'Tiago', email: 'tiago@email.com',
                   bio: 'Bacharel em Portugues')

    visit root_path
    click_on 'Instrutores'
    click_on 'Apagar Rogerio'      
    expect(page).not_to have_content('Rogerio')
    expect(page).not_to have_content('rogerio@email.com')
    expect(page).not_to have_content('Bacharel em Matematica')
  end
end

