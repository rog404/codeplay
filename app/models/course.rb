class Course < ApplicationRecord
    validates :name, :code, :price, presence: true
    validates :code, uniqueness: true

    has_one_attached :banner
    belongs_to :instructor
    has_many :lessons

    after_commit :attach_default_banner, on: [:create, :update]

    private
    def attach_default_banner
        unless banner.attached?
            banner.attach(io: File.open(Rails.root.join('public/default-banner.png')),
            filename: 'default-banner.png'
        )
        end
    end
end
