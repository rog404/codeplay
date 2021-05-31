require 'rails_helper'

describe 'Admin registers lessons' do
  it 'successfully' do
    user = User.create!(email: 'jane@test.com.br', password: '123456')
    login_as user, scope: :user
    instructor = Instructor.create!(name: 'Fulano Sicrano',
                                    email: 'fulano@codeplay.com.br')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', instructor: instructor)

    visit course_path(course)
    click_on 'Registrar uma aula'
    fill_in 'Nome', with: 'Duck Typing'
    fill_in 'Duração', with: '10'
    fill_in 'Conteúdo', with: 'Uma aula muito legal'
    click_on 'Cadastrar'

    expect(page).to have_text('Duck Typing')
    expect(page).to have_text('10 minutos')
    expect(page).to have_text('Aula cadastrada com sucesso')
    expect(current_path).to eq(course_path(course))
  end

  it 'and fill and fields' do
    instructor = Instructor.create!(name: 'Fulano Sicrano',
                                    email: 'fulano@codeplay.com.br')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', instructor: instructor)

    visit course_path(course)
    click_on 'Registrar uma aula'
    click_on 'Cadastrar'

    expect(page).to have_text('Nome não pode ficar em branco')
    expect(page).to have_text('Duração não pode ficar em branco')
    expect(page).to have_text('Conteúdo não pode ficar em branco')
  end
end