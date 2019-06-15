class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_actionは、全てのアクションが呼ばれる前に実行される。
  before_action :current_user
  
  private
  
  def current_user
    # user_idの情報が無ければsessionを返す
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
end