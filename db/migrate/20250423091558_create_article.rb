class CreateArticle < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :contenu

      t.timestamps
    end
  end
end
