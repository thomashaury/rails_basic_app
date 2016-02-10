class SponsoredPost < ActiveRecord::Base
  belongs_to :topic # topic_id
end
