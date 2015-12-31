class Workflow < ActiveRecord::Base
  serialize :inputs
  serialize :options

  def validate_with_cromwell!
    file = Tempfile.open('wdl_workflow', Rails.root.join('tmp'))

    begin 
      file.write(wdl_source)
    ensure
      file.close
    end

    output = `cromwell validate #{file.path}`
    update(is_valid: output.empty?)
    
  end  
end
