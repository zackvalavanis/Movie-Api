class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :lead_actor
      t.integer :sales

      t.timestamps
    end
  end
end
