module Wedding
  module EventsHelper
    def attachment_path(attachment, style = :background)
      if attachment.present?
        attachment.url(attachment.styles.keys.include?(style) ? style : :background)
      else
        asset_path("missing/default/#{style}.jpg")
      end
    end
  end
end
