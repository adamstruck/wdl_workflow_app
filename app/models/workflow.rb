class Workflow < ActiveRecord::Base
  serialize :inputs
  serialize :options

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

end
