class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :name
      t.integer :version
      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
