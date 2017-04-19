class Asset < ApplicationRecord
  include AssetAdmin
  IMAGE_CONTENT_TYPES = ["image/jpeg", "image/png", "image/jpg", "image/gif"]

  belongs_to :owner, polymorphic: true, inverse_of: :assets

  # add a delete_<asset_name> method:
  attr_accessor :delete_asset

  has_attached_file :attachment, default_url: lambda { |f| "#{f.instance.create_default_url}" },
                            storage: :cloudinary,
                            path: ':id/:style/:filename',
                            styles: Proc.new { |f| f.instance.styles },
                            cloudinary_credentials: Rails.root.join("config/cloudinary.yml"),
                            default: {
                              tags: [ 'MeuCasamento', 'Asset' ],
                              context: {
                                caption: lambda { |style_name, attachment| attachment.instance.attachment_file_name }
                              }
                            }


  validates_attachment_presence :attachment
  validates_attachment_content_type :attachment, content_type: IMAGE_CONTENT_TYPES
  validates_attachment_file_name :attachment, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment_size :attachment, :less_than => 5.megabytes

  before_validation { self.asset.clear if self.delete_asset == '1' }

  def to_s
    attachment_file_name
  end

  def dynamic_attachment_url(format)
    @dynamic_style_format = format
    attachment.reprocess!(dynamic_style_format_symbol) unless attachment.exists?(dynamic_style_format_symbol)
    attachment.url(dynamic_style_format_symbol)
  end

  def styles
    # if Rails.env.development?
      {
        background: '1600x1600#',
        slider: '1600x900>',
        medium: '370x370#',
        small: '270x270#',
        smaller: '170x170#'
      }
    # else
    #   if @dynamic_style_format.present?
    #     { dynamic_style_format_symbol => @dynamic_style_format }
    #   else
    #     {}
    #   end
    # end
  end

  def create_default_url
     ActionController::Base.helpers.asset_path(
      Rails.root.join("public/missing/default/:style.jpg"), :digest => false)
  end

  protected
  def dynamic_file_name
    [/png\Z/, /jpe?g\Z/, /gif\Z/]
  end

  def dynamic_style_format_symbol
    URI.escape(@dynamic_style_format).to_sym
  end
end
