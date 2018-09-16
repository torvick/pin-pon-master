class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.belongs_to  :game, foreign_key: true
      t.float :value
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
