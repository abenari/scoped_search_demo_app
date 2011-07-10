class Book < ActiveRecord::Base
  attr_accessible :name, :author_id, :description, :price, :published_at, :in_stock
  belongs_to :author

  scoped_search :on => :name, :complete_value => :true, :default_order => true
  scoped_search :on => :description, :complete_value => :false
  scoped_search :in => :author, :on => :last_name, :complete_value => true, :rename => :"author.last"
  scoped_search :in => :author, :on => :first_name, :complete_value => true, :rename => :"author.first"

end
