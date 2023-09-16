class CreateCardcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :cardcomments do |t|
      t.references :task, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
