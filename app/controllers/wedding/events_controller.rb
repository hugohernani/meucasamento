module Wedding
  class EventsController < Wedding::BaseController

    def gallery_images
      @gallery_images = @current_event.gallery.assets
        .paginate(page: params[:page], per_page: 24)
    end
  end
end
