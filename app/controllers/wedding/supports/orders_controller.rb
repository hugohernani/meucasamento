module Wedding
  module Supports
    class OrdersController < Wedding::BaseController

      # Gerar um Token de sessão para nosso pagamento
      def new
        @donation = Donation.find(params[:donation_id])
        @session_id = (PagSeguro::Session.create).id
        @donation_form = DonationForm.new
      end

      def donation_params
        params.require(:donation_form).permit(:card_token, :sender_hash, :session_id, :name, :email, :cpf,
                      :phone_code, :phone_number, :birthday, :card_name, :card_number,
                      :card_month, :card_year, :card_cvv, :card_options, :donation_id)
      end

      # Enviar nosso pagamento para o Pagseguro
      def create
        @donation_form = DonationForm.new(donation_params)
        @product = Donation.find(donation_params[:donation_id])

        payment = PagSeguro::CreditCardTransactionRequest.new
        payment.notification_url = ""
        payment.payment_mode = "gateway"

        # Aqui vão os itens que serão cobrados na transação, caso você tenha multiplos itens
        # em um carrinho altere aqui para incluir sua lista de itens
        payment.items << {
          id: @product.id,
          description: @product.description,
          amount: @product.price,
          weight: 0
        }

        # Criando uma referencia para a nossa ORDER
        reference = "REF_#{(0...8).map { (65 + rand(26)).chr }.join}_#{@product.id}"
        payment.reference = reference
        payment.sender = {
          hash: donation_params[:sender_hash],
          name: donation_params[:name],
          email: donation_params[:email]
        }

        payment.credit_card_token = donation_params[:card_token]
        payment.holder = {
         name: donation_params[:card_name],
         birth_date: donation_params[:birthday],
         document: {
           type: "CPF",
           value: donation_params[:cpf]
         },
         phone: {
           area_code: donation_params[:phone_code],
           number: donation_params[:phone_number]
         }
        }

        payment.installment = {
         value: @product.price,
         quantity: 1
        }

        puts "=> REQUEST"
        puts PagSeguro::TransactionRequest::RequestSerializer.new(payment).to_params
        puts

        payment.create

        # Cria uma Order para registro das transações
        Order.create(donation_id: @product.id, buyer_name: donation_params[:name], reference: reference, status: 'pending')

        if @donation_form.valid? && payment.errors.empty?
          redirect_to wedding_supports_path,
            flash: { notice: 'Obrigado. Sua doação foi realizada com sucesso!' }
        else
          @donation_form.payment_errors = payment.errors
          puts "Payment Errors:"
          puts payment.errors
          puts @donation_form.errors.messages
          @donation = @product
          @session_id = (PagSeguro::Session.create).id
          render :new and return
        end
      end

      def index
        @orders = Order.all
      end
    end
  end
end
