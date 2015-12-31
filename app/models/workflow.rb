class Workflow < ActiveRecord::Base
  serialize :inputs
  serialize :options
end
