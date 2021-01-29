class User < ApplicationRecord
    has_secure_password
    belongs_to :usable, polymorphic: true
    validates :username, uniqueness: true

    def user_tailor?
        self.usable_type == "Tailor"
    end
    
    def user_association
        if self.usable_type == "Client"
            client = Client.create
            measurement = Measurement.create(client_id: client.id)
            self.usable_id = client.id
        else
            tailor = Tailor.create
            self.usable_id = tailor.id
        end
    end

    def tailor
        Tailor.find_by(id: self.usable_id)
    end

    def client
        Client.find_by(id: self.usable_id)
    end

    def all_tailors
        @tailors = User.all.select do |user|
            byebug
            user.usable_type == "Tailor"
        end
    end

end
