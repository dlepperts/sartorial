class Tailor < ApplicationRecord
    has_many :alterations
    has_many :reviews
    has_many :clients, through: :alterations
    has_many :clients, through: :reviews
end
