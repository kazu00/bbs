class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # 以下のカラムは値を必要とする為nullをfalseとする
      t.string :name, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end
