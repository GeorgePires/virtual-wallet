require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do
    get('list users') do
      response(200, 'successful') do

        after do |req|
          req.metadata[:response][:content] = {
            'application/json' => {
              req: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'user_id'

    get('show user transactions') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |req|
          req.metadata[:response][:content] = {
            'application/json' => {
              req: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
