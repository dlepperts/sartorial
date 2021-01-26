class Alteration < ApplicationRecord
    belongs_to :client
    belongs_to :tailor
    has_one :item_type
end
