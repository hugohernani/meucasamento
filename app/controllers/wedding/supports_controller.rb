module Wedding
  class SupportsController < Wedding::BaseController
    respond_to :js, only: [:show_products]
    skip_before_filter :verify_authenticity_token, only: [:show_products]

    def index
    end

    def show_products
      @stores = @current_event.wedding_support.wedding_list.stores
      @current_store = store || @stores.first

      respond_with(@current_store) do |format|
        format.js { render :show_products }
      end
    end

    private
    def store
      @store ||= Store.find(params[:store_id])
    end
  end
end
