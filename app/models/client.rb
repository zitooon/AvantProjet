class Client < ActiveRecord::Base
  belongs_to :category
  has_many :refrences
  validates_presence_of :name
end
