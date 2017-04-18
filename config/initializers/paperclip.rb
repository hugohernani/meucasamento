Paperclip::Attachment.default_options[:storage] = :dropbox if Rails.env == "production"
