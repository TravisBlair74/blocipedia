class CreateCollaborations < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborations do |t|
      t.integer :wiki_id
      t.integer :user_id
      t.timestamps
    end
    add_index :collaborations, [:wiki_id, :user_id]
  end
end
