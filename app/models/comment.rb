class Comment < ApplicationRecord
  include CommentAdmin
  belongs_to :commentable,          polymorphic: true,
                                    inverse_of: :comments,
                                    foreign_key: 'commentable_id'

  validates :name, :email, :content, presence: true
end
