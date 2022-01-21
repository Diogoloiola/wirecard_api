module Admin
  module V1
    class PaymentsController < ApplicationController
      before_action :set_payment, only: %i[show update destroy]

      def index
        @payments = Payment.all
      end

      def show; end

      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render :show, status: :created
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @payment.update(payment_params)
          render :show, status: :ok
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @payment.destroy
      end

      # rubocop:disable Metrics/MethodLength
      def generate_billing
        params = payment_params
        card = find_card(params[:card])
        return render json: { message: 'Cartão não encontrado na nossa base de dados' } if card.nil?

        user = find_user(params[:buyer], params[:client_id])

        return render json: { message: 'Usuário não encontrado na nossa base de dados' } if user.nil?

        @payment = create_payment(params[:payment], user.id)

        if @payment.save
          render :show, status: :created
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_payment
        @payment = Payment.find(params[:id])
      end

      def payment_params
        params.fetch(:payment).permit(:client_id, :billing_type, buyer: {}, card: {}, payment: {})
      end

      def find_card(card)
        Card.find_by(holder_name: card[:holder_name], number: card[:number],
                     expiration: card[:expiration_date], cvv: card[:cvv])
      end

      def create_payment(payment, user_id)
        if payment[:billing_type]
          # sleep(40.seconds)
          Payment.new(amount: payment[:amount], billing_type: payment[:billing_type], user_id: user_id)
        else
          hash = Digest::SHA256.hexdigest("#{Time.zone.now}#{user_id}}")
          Payment.new(amount: payment[:amount], billing_type: payment[:billing_type], user_id: user_id, code: hash)
        end
      end

      def find_user(user, client_id)
        User.find_by(name: user[:name], email: user[:email], cpf: user[:cpf], id: client_id)
      end
    end
  end
end
