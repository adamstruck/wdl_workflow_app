class Workflow < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  
  serialize :inputs
  serialize :options
  serialize :tags
  
  validates :name, :wdl_source, presence: true
  
  def cromwell_validate!
    file = Tempfile.open('wdl_workflow', Rails.root.join('tmp'))
    begin 
      file.write(wdl_source)
    ensure
      file.close
    end
    output = `cromwell validate #{file.path}`
    update(is_valid: output.empty?)    
  end

  def cromwell_create_html!
    file = Tempfile.open('wdl_workflow', Rails.root.join('tmp'))
    begin 
      file.write(wdl_source)
    ensure
      file.close
    end    
    output = `cromwell highlight #{file.path} html`
    unless output.empty?
      update(html: output)
    end
  end

  def cromwell_create_inputs_template!
    file = Tempfile.open('wdl_workflow', Rails.root.join('tmp'))
    begin 
      file.write(wdl_source)
    ensure
      file.close
    end    
    output = `cromwell inputs #{file.path}`
    unless output.include? "cromwell.parser.WdlParser$SyntaxError: ERROR"
      update(inputs: JSON.parse(output))
    end
  end

end
