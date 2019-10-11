class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.string :cook_time
      t.timestamps
    end
  end
end
