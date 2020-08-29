class SessionsController < ApplicationController
    def new
    end 

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:alert] = "Login is incorrect"
            redirect_to new_user_path
        end 

    end 

    def destroy 
        session.delete(:user_id)
        redirect_to root_path
    end 

end 