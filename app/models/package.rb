class Package < ActiveRecord::Base
    attr_accessible :name, :version
    belongs_to :host
  validates_presence_of :name, :version
  validates_uniqueness_of :name
  scoped_search :on => :name
  scoped_search :on => :version , :only_explicit => true
  #scoped_search :in => :host, :on => :name, :alias => :host, :only_explicit => true
  #scoped_search :in => :host, :on => :memory, :alias => :host_memory, :only_explicit => true
end
