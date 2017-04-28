class ProductHandling < ApplicationRecord
  IMAGE_CONTENT_TYPES = ["image/jpeg", "image/png", "image/jpg", "image/gif"]
  after_initialize :set_date
  belongs_to :product, class_name: Product, inverse_of: :handlings

  validates :buyer_name, :phone_number, :phone_number, :bought_date, presence: true

  has_attached_file :file,
                    default_url: 'public/missing/default/:style.jpg',
                    styles: { thumbnail: '60x60x' },
                    default_url: 'noimage/:style.png',
                    path: ':rails_root/public/attachments/:class/:attachment/:id/:id_partition/:filename'

  validates_attachment :file,
    presence: true,
    content_type: {
      content_type: ["application/pdf", "image/jpeg", "image/png", "image/jpg", "image/gif"]
    }

  private
  def set_date
    self.bought_date = DateTime.now unless self.bought_date
  end
end
