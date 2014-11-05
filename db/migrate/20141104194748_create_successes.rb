class CreateSuccesses < ActiveRecord::Migration
  def change
    create_table :successes do |t|
      t.string :user
      t.text :text

      t.timestamps
    end
  end
end