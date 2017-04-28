module Wedding
  module EventsHelper
    def attachment_path(attachment, style = :background)
      if attachment.exists?
        attachment.url(attachment.styles.keys.include?(style) ? style : :background)
      else
        asset_path("missing/default/#{style}.jpg")
      end
    end

    def months_options
      I18n.t('date.abbr_month_names').drop(1).each_with_index.
        map{|m,i| ["#{m} (#{sprintf("%02d", i+1)})",sprintf("%02d", i+1)] }
    end

    def year_options
      (Time.current.year..(Time.current.year+15)).map{|i| [i, i]}
    end
  end
end
