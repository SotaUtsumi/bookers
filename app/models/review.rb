class Review < ApplicationRecord
    has_one_attached :image

    validates :image, presence: { message: 'を選択してください'}
    
end
