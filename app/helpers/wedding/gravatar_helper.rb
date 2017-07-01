require 'digest/md5'

module Wedding
  module GravatarHelper
    GRAVATAR_API_URL = 'http://gravatar.com/avatar/'
    GRAVATAR_SECURE_API_URL = 'https://secure.gravatar.com/avatar/'

    def gravatar_url( email, options = { } )
      options = {
        secure: true,
        size: 160,
        default: 'mm',
        rating: :g,
        force: false
      }.merge( options )

      if options[:secure]
        url = GRAVATAR_SECURE_API_URL
      else
        url = GRAVATAR_API_URL
      end

      url += Digest::MD5.hexdigest( email )

      url += '?'
      url += "s=#{options[:size]}&" if options[:size] != 80
      url += "d=#{options[:default]}&" if options[:default] != nil
      url += "r=#{options[:rating]}&" if options[:rating] != :g
      url += 'f=y&' if options[:force]

      url[0...-1] # Removes the last charecter (an extra ? or &)
    end
  end
end
