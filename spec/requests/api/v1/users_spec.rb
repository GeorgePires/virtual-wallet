require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do
    get('list users') do
      consumes 'application/json'
      
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

  path '/api/v1/users/current_balance/{id}' do
    get('User current balance') do
      consumes 'application/json'

      parameter name: 'id', in: :path, type: :string, description: 'ID of user'

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

  path '/api/v1/users/transactions/{id}' do
    get('show user transactions') do
      consumes 'application/json'

      parameter name: 'id', in: :path, type: :string, description: 'ID of user'

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
