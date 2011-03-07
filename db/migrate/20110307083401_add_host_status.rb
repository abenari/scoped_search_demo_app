class AddHostStatus < ActiveRecord::Migration
  def self.up
      add_column :hosts, :status, :integer, :default => 0
  end

  def self.down
    remove_column :hosts, :status
  end
end
