class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :name
      t.references :author
      t.text :description
      t.integer :price
      t.timestamp :published_at
      t.boolean :in_stock
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
