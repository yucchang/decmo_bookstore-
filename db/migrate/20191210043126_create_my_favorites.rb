class CreateMyFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :my_favorites do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
