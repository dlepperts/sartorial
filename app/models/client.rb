class Client < ApplicationRecord
    has_one :user, as: :usable
    has_many :alterations
    has_many :reviews
    has_many :tailors, through: :alterations
    has_many :tailors, through: :reviews
    has_one :measurement
    accepts_nested_attributes_for :measurement
end
