class Post < ApplicationRecord
  include PostAdmin
  belongs_to :blog,               class_name: Blog,
                                  inverse_of: :posts,
                                  foreign_key: 'blog_id',
                                  required: true

  has_many :comments,             class_name: Comment,
                                  as: :commentable,
                                  dependent: :destroy

  has_one :assets,                class_name: Asset,
                                  inverse_of: :owner,
                                  as: :owner,
                                  dependent: :destroy

  alias_attribute :image, :assets

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  validates :title, :content, presence: true

  enum status: {draft: 0, published: 1}

  def assets
    super || build_assets
  end

  def image
    assets || build_assets
  end
end
