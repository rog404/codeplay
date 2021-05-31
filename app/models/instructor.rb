class Instructor < ApplicationRecord
    validates :email, uniqueness: true

    has_one_attached :profile_picture
    has_many :courses, dependent: :destroy

    def display_name
        "#{name} - #{email}"
    end
end
