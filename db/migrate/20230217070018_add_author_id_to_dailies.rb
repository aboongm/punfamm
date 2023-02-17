class AddAuthorIdToDailies < ActiveRecord::Migration[7.0]
  def change
    add_reference :dailies, :editor, null: false, foreign_key: { to_table: :users}
  end
end