module Admin
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def index
        @users = User.includes([:payments])
      end

      def show; end

      def create
        @user = User.new(user_params)

        if @user.save
          render :show, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render :show, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
      end

      def payments
        final_date = params[:final_date] || Time.zone.now

        initia_date = if params[:inicial_date].nil?
                        Payment.where(user_id: params[:id]).first.created_at
                      else
                        Date.parse(params[:inicial_date])
                      end

        @payments = Payment.where(created_at: initia_date..final_date)
      end

      private

      def set_user
        @user = User.find(params[:id])
      rescue StandardError
        render json: { message: 'Usuário não encontrado' }
      end

      def user_params
        params.require(:user).permit(:name, :cpf, :email)
      end
    end
  end
end
