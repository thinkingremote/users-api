module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json
      skip_before_filter  :verify_authenticity_token
      
      def create
        @user = User.new(user_parmas)
        if @user.save
          respond_to do |format|
            format.json { render :json => @user }
          end
        end
      end
      
      def index
        @users = User.all
      end
      
      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
      
      def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
      
      def show
      end

      private
        def user_parmas
          params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :country, :zipcode)
        end
      
    end
  end
end
