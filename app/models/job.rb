class Job < ActiveRecord::Base

  belongs_to :workflow

  serialize :inputs
  serialize :options
  
end
