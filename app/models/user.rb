class User < ApplicationRecord
    has_secure_password
    belongs_to :usable, polymorphic: true
    validates :username, uniqueness: true
end
