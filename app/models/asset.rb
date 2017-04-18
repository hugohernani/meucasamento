class Asset < ApplicationRecord
  include AssetAdmin
  IMAGE_CONTENT_TYPES = ["image/jpeg", "image/png", "image/jpg", "image/gif"]

  belongs_to :owner, polymorphic: true, inverse_of: :assets

  # add a delete_<asset_name> method:
  attr_accessor :delete_asset

  has_attached_file :file,  default_url: lambda { |f| "#{f.instance.create_default_url}" },
                            dropbox_credentials: Rails.root.join("config/dropbox.yml"),
                            styles: { large: '860x640>' } #Proc.new { |f| f.instance.styles }


  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: IMAGE_CONTENT_TYPES
  validates_attachment_file_name :file, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment_size :file, :less_than => 5.megabytes

  before_validation { self.asset.clear if self.delete_asset == '1' }

  protected
  def dynamic_file_name
    [/png\Z/, /jpe?g\Z/, /gif\Z/]
  end

  def styles
    unless @dynamic_style_format.blank?
      { dynamic_style_format_symbol => @dynamic_style_format }
    else
      {}
    end
  end

  def dynamic_style_format_symbol
    URI.escape(@dynamic_style_format).to_sym
  end

  def dynamic_attachment_url(format)
    @dynamic_style_format = format
    file.reprocess!(dynamic_style_format_symbol) unless file.exists?(dynamic_style_format_symbol)
    file.url(dynamic_style_format_symbol)
  end

  private
  def create_default_url
     ActionController::Base.helpers.asset_path(
      Rails.root.join("public/missing/default/:style.png"), :digest => false)
  end
end
