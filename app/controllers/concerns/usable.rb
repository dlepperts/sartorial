module Usable
    extend ActiveSupport::concerns

    included do
        has_one :user, :as => :reviewable
    end

end
