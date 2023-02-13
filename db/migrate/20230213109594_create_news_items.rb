class CreateNewsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :news_items do |t|
      t.string :headline
      t.text :content
      t.date :date
      t.references :reporter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
