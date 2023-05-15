# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/wallets', type: :request do
  path '/api/v1/wallets/credit' do
    post('credit wallet') do
      consumes 'application/json'

      parameter name: 'user_id', in: :query, type: :integer, description: 'ID of user'
      parameter name: 'amount', in: :query,  type: :decimal, description: 'Amount to be credited'

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

  path '/api/v1/wallets/debit' do
    post('debit wallet') do
      consumes 'application/json'

      parameter name: 'user_id', in: :query, type: :integer, description: 'ID of user'
      parameter name: 'amount', in: :query,  type: :decimal, description: 'Amount to be debited'

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
end
