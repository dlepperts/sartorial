class Alteration < ApplicationRecord
    belongs_to :client
    belongs_to :tailor
    has_many :item_types
end
