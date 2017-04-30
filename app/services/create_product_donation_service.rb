class CreateProductDonationService
  def self.perform(current_event, product_id)
    product = Product.find(product_id)
    donation = Donation.find_or_initialize_by(product_id: product_id)
    donation.wedding_list = current_event.wedding_support.wedding_list
    donation.price = product.price
    donation.save
    donation
  end
end
