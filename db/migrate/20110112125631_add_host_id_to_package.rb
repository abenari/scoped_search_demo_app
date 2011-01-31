class AddHostIdToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :host_id, :integer
  end

  def self.down
    remove_column :packages, :host_id
  end
end
