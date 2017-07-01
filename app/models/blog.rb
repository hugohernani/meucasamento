class Blog < ApplicationRecord
  include BlogAdmin
  belongs_to :event,        class_name: Event,
                            inverse_of: :blog,
                            foreign_key: 'event_id',
                            required: true

  has_many :posts,          class_name: Post,
                            inverse_of: :blog,
                            foreign_key: 'blog_id',
                            dependent: :destroy

  accepts_nested_attributes_for :posts, reject_if: :all_blank, allow_destroy: true
end
