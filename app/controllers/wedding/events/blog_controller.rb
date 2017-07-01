module Wedding
  module Events
    class BlogController < Wedding::BaseController

      def index
        @blog = @current_event.blog
      end
    end
  end
end
