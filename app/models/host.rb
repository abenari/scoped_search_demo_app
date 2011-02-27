class Host < ActiveRecord::Base
  attr_accessible :name, :memory
  has_many  :packages
 # scoped_search :on => [:name, :memory]
  scoped_search :on => :name, :complete_value => true
  scoped_search :on => :created_at, :only_explicit => true
  scoped_search :on => :memory, :only_explicit => true, :complete_value => true
  scoped_search :in => :packages, :on => :name, :complete_value => true
  scoped_search :in => :packages, :on => :version, :only_explicit => true, :complete_value => true

  def to_s
    name
  end
end
