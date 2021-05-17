class Instructor < ApplicationRecord
    validates :email, uniqueness: true
    has_one_attached :profile_picture
end
