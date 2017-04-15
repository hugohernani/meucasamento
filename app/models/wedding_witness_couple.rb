class WeddingWitnessCouple < ApplicationRecord
  belongs_to :fiance, class_name: Account, inverse_of: :my_witnesses
end
