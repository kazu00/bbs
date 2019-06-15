class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    # ユーザオブジェクト(新規登録情報)を作成する
    user = User.new(user_params)
    # バリデーションチェックがtrueであれば、ユーザーオブジェクトを保存する。
    if user.save
      # 登録したユーザーのidをsessionのキーに保存する。
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      # バリデーションチェックに引っかかればエラーメッセージを表示する。
      redirect_back fallback_location: new_user_path, flash: {
        # ユーザーオブジェクトとエラーメッセージが表示される。
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
