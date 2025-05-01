class CreateComment < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
