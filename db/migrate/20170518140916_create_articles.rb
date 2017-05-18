class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :annotation
      t.datetime :expired_at

      t.timestamps
    end
  end
end
