require 'rails_helper'

describe 'Admin deletes instructors' do
  it 'successfully' do
    user = User.create!(email: 'jane@test.com.br', password: '123456')
    login_as user, scope: :user
    Instructor.create!(name: 'Rogerio', email: 'rogerio@email.com',
                        bio: 'Bacharel em Matematica')
    instructor= Instructor.create!(name: 'Tiago', email: 'tiago@email.com',
                                    bio: 'Bacharel em Portugues')
    visit instructor_path(instructor)
    expect { click_on 'Apagar' }.to change { Instructor.count }.by(-1)
    expect(current_path).to eq(instructors_path)
  
        
    end
end