json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :wdl_source, :is_valid, :html, :inputs, :options
  json.url workflow_url(workflow, format: :json)
end
