class CreateGundams < ActiveRecord::Migration[7.0]
  def change
    create_table :gundams do |t|
      t.string :name
      t.integer :year
      t.text :story

      t.timestamps
    end
  end
end
