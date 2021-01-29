class Tailor < ApplicationRecord
    has_one :user, as: :usable
    has_many :alterations
    has_many :reviews
    has_many :clients, through: :alterations
    has_many :clients, through: :reviews

    def display_ratings
        total = self.reviews.map do |review|
            review.rating
        end
        if total.count == 0
            "No Reviews Yet!"
        else
        rating = total.sum.to_f / total.count
        "#{rating} / 5"    
        end
    end

    def average_ratings
        total = self.reviews.map do |review|
            review.rating
        end
    end

    def display_ratings
                total = self.reviews.map do |review|
            review.rating
        end
        if total.count == 0
            "No Reviews Yet!"
        else
        rating = total.sum.to_f / total.count
        "#{rating.round(1)} / 5"    
        end
    end

    def review 
        number = self.reviews.count
        if number == 1
            "#{number} Review"
        else
            "#{number} Reviews"
        end
    end

    def self.sort_rating
        Tailor.all.max_by do |tailor|
            tailor.average_ratings
        end
    end

    def self.featured_tailor
        Tailor.all.max_by do |tailor|
            tailor.reviews.each do |review|
                review.rating
            end
     end
    end
end



