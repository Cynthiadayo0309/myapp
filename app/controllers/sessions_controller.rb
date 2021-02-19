class SessionsController < ApplicationController
  def new
    redirect_to "/boards" if current_user
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
       log_in(user)
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
       redirect_to "/boards"
    else
      flash.now[:danger] = '有効なメールアドレス、またはパスワードではありません。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to "/login"
  end
end
