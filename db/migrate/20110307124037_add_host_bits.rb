class AddHostBits < ActiveRecord::Migration
  def self.up
    add_column :hosts, :bits, :integer, :default => 0
  end

  def self.down
    remove_column :hosts, :bits
  end
end
