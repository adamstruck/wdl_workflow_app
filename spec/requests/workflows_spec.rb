require 'rails_helper'

RSpec.describe "Workflows", type: :request do
  describe "GET /workflows" do
    it "works! (now write some real specs)" do
      get workflows_path
      expect(response).to have_http_status(200)
    end
  end
end
