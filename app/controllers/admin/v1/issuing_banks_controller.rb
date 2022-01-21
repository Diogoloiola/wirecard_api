module Admin
  module V1
    class IssuingBanksController < ApplicationController
      before_action :set_issuing_bank, only: %i[show update destroy]

      def index
        @issuing_banks = IssuingBank.all
      end

      def show; end

      def create
        @issuing_bank = IssuingBank.new(issuing_bank_params)

        if @issuing_bank.save
          render :show, status: :created
        else
          render json: @issuing_bank.errors, status: :unprocessable_entity
        end
      end

      def update
        if @issuing_bank.update(issuing_bank_params)
          render :show, status: :ok
        else
          render json: @issuing_bank.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @issuing_bank.destroy
      end

      private

      def set_issuing_bank
        @issuing_bank = IssuingBank.find(params[:id])
      end

      def issuing_bank_params
        params.fetch(:issuing_bank).permit(:name)
      end
    end
  end
end
