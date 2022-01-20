module Admin
  module V1
    class CardsController < ApplicationController
      before_action :set_card, only: %i[show update destroy]

      def index
        @cards = Card.all
      end

      def show; end

      def create
        @card = Card.new(card_params)

        if @card.save
          render :show, status: :created, location: @card
        else
          render json: @card.errors, status: :unprocessable_entity
        end
      end

      def update
        if @card.update(card_params)
          render :show, status: :ok, location: @card
        else
          render json: @card.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @card.destroy
      end

      def validate
        @card = Card.find_by(cvv: params[:id])
        render :result
      end

      private

      def set_card
        @card = Card.find(params[:id])
      end

      def card_params
        params.require(:card).permit(:holder_name, :expiration, :cvv, :user_id)
      end
    end
  end
end
