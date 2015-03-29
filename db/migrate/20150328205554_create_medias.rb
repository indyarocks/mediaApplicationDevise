class CreateMedias < ActiveRecord::Migration
  def change
    create_table :medias do |t|
      t.references :user
      t.string :description
      t.string :url
      t.integer :permission

      t.timestamps null: false
    end
  end
end
