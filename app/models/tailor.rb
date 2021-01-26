class Tailor < ApplicationRecord
    has_many :alterations
    has_many :reviews
    has_many :clients, through: :alterations
    has_many :clients, through: :reviews

    def average_ratings
        total = self.reviews.map do |review|
            review.rating
        end
        if total.count == 0
            "No Reviews Yet!"
        else
        total.sum.to_f / total.count
        end
    end
end
