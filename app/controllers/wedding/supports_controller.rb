module Wedding
  class SupportsController < Wedding::BaseController
    respond_to :js, only: [:show_products, :show_product]
    skip_before_action :verify_authenticity_token, only: [:show_products, :show_product, :update_product]
    before_action :load_product, only: [:show_product, :update_product]

    def index
    end

    def show_products
      @stores = @current_event.wedding_support.wedding_list.stores.includes(:products)
      @current_store = store || @stores.first

      respond_with(@current_store) do |format|
        format.js { render :show_products }
      end
    end

    def show_product
      @product_handling = ProductHandling.new

      respond_with(@product) do |format|
        format.js { render 'show_product' }
      end
    end

    def update_product
      @product_handling = @product.handlings.new(product_handling_params)
      if @product_handling.save
        redirect_to "#{wedding_supports_path}#lista-de-presentes",
          notice: "Obrigado! Noivos serão notificados"
      end
    end

    def donate_product_price
      donation = CreateProductDonationService.perform(@current_event, params[:product_id])
      redirect_to new_wedding_support_orders_path(
        support_id: @current_event.wedding_support.id, donation_id: donation.id)
    end

    private
    def store
      @store ||= Store.find(params[:store_id])
    end

    def product_handling_params
      params.require(:product_handling).permit(:buyer_name, :phone_number,
        :bought_date, :file)
    end

    def load_product
      @product = Product.find(params[:product_id])
    end
  end
end
