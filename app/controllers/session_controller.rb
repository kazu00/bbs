class SessionController < ApplicationController
  def create
    # find_byメソッドは引数で指定してマッチした値を１つ取得する。
    # 該当しない、であればnillが入る。
    user = User.find_by(name: params[:session][:name])
    # ユーザが登録されている、かつ、正しく認証できているかを確認している。
    if user && user.authenicate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    #session情報からuserのidを削除することでログアウトしている。
    session.delete(:user_id)
    redirect_to root_path
  end
end
