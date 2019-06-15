# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ApplicationRecord
  has_secure_password
  
  validates :name,
    presence: true,  # 入力しないとエラーになる
    uniqueness: true, # 既に使用していユーザー名は登録できない
    length: { maximum: 16 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }
  validates :password,
  length: { minimum: 8 }
  
  def age
    # 日本時間を取得
    now = Time.zone.now
    # 現在時間 - 生年月日 <= これで値数を取得している。
    # 10000は年数のみを取得するため。月以下は切り捨て
    (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
end
