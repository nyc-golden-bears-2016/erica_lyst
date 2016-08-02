class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :category_id
      t.string :secret_key

      t.timestamps
    end
  end
end
