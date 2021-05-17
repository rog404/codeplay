require 'rails_helper'

describe 'Admin create instructor' do
    it 'successfully' do
      
      visit root_path
      click_on 'Instrutores'
      
      click_on 'Adicionar instrutor'
      

      expect(page).to have_content('Rogerio')
      expect(page).to have_content('rogerio@email.com')
      expect(page).to have_content('Bacharel em Matematica')
    end
  
    it 'and do not allow iqual email' do
    end
end