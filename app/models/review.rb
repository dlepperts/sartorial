class Review < ApplicationRecord
    belongs_to :tailor
    belongs_to :client

    # validate :valid_review

    # def valid_review
    #     tailors = self.client.alterations.map do |alteration|
    #         alteration.tailor
    #     end
    #     if tailors.none?(self.tailor)
    #         self.errors[:tailor] << "Make sure this is the correct tailor!"
    #     end
    # end
end
