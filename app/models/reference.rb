class Reference < ActiveRecord::Base
  belongs_to :client
  
  validates_presence_of :title, :owner, :date
end
