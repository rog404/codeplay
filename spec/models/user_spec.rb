require 'rails_helper'

describe User do
  context 'validation' do
    it 'email must be uniq' do
      User.create!(email: 'jane@test.com.br', password: '123456')

      user = User.create(email: 'jane@test.com.br', password: '123456')
      user.valid?

      expect(user.errors[:email]).to include('já está em uso')
    end
  end
end