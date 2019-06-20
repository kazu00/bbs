class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user  # before_actionは、全てのアクションが呼ばれる前に実行される。
  
  private
  
  def current_user
    return unless session[:user_id]  # user_idの情報が無ければsessionを返す
    @current_user = User.find_by(id: session[:user_id])
  end
end