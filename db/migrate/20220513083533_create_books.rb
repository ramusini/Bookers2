class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      #本のタイトル
      t.string :title
      #本の感想文
      t.text :body
      #誰が投稿したのか紐付け
      t.integer :user_id

      t.timestamps
    end
  end
end
