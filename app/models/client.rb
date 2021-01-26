class Client < ApplicationRecord
    has_many :alterations
    has_many :reviews
    has_many :tailors, through: :alterations
    has_many :tailors, through: :reviews
    has_one :measurement
end
