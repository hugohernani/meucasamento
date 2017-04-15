class LoveStory < ApplicationRecord
  belongs_to :event,        class_name: Event, inverse_of: :love_story

  validates :we_met, :first_date, :engagement, presence: true
end
