class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title  # カラム定義
      t.string :body # カラム定義
      t.timestamps
    end
  end
end
