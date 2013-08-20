class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
