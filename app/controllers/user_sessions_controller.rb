class UserSessionsController < ApplicationController
  skip_before_filter :require_user, only: [:new, :create]

  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /user_session
  def create
    logger.debug("----------user_session_controller#create------")
    logger.debug(params)
    logger.debug("----------------------------------------------")
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      #redirect_to root_url
      redirect_to controller: :koutsuhis, action: :index 
    else
      render action: :new
    end
  end

  # DELETE /logout
  def destroy
    current_user_session.destroy
    redirect_to sign_in_url
  end

  private
    def user_session_params
      logger.debug("---------- user_session_params ----------")
      params.require(:user_session).permit(:email, :password)
    end


end
