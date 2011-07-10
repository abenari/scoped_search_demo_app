class Book < ActiveRecord::Base
  attr_accessible :name, :author_id, :description, :price, :published_at, :in_stock
  belongs_to :author
end
