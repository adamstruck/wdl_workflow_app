class Job < ActiveRecord::Base

  belongs_to :workflow

  serialize :inputs
  serialize :options

  def run!

  end

  def check_status!

  end

  def fetch_results!

  end
  
end
