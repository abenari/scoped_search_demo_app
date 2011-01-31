class Host < ActiveRecord::Base
  attr_accessible :name, :memory
  has_many  :packages
 # scoped_search :on => [:name, :memory]
  scoped_search :on => :name, :alias => :namo
  scoped_search :on => :memory, :only_explicit => true
  scoped_search :in => :packages, :on => :name, :alias => :package, :only_explicit => true
  def to_s
    name
  end
end
