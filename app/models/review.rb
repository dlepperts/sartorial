class Review < ApplicationRecord
    belongs_to :tailor
    belongs_to :client
end
