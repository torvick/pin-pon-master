class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :from_user, foreign_key: { to_table: :users }
      t.references :to_user,   foreign_key: { to_table: :users }
      t.string :winner
      t.string :loser
      t.boolean :status

      t.timestamps
    end
  end
end
