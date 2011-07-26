class CreateHoges < ActiveRecord::Migration
  def self.up
    create_table :hoges do |t|
      t.string :name
      t.integer :num
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :hoges
  end
end
