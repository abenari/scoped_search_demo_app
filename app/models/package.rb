class Package < ActiveRecord::Base
  attr_accessible :name, :version, :host_id
  belongs_to :host

  validates_presence_of :name, :version
  validates_uniqueness_of :name
  
  scoped_search :on => :name
  scoped_search :on => :version , :only_explicit => true
  scoped_search :in => :host, :on => :name, :rename => 'host.name'.to_sym, :complete_value => true
  scoped_search :in => :host, :on => :memory, :rename => 'host.memory'.to_sym, :complete_value => true, :only_explicit => true
end
