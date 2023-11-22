# frozen_string_literal: true

# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    post 'index a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string }
        },
        required: %w[title description]
      }

      response '201', 'product created' do
        let(:product) { { title: 'foo', description: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:product) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/products/{id}' do
    get 'show a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'product found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 description: { type: :string }
               },
               required: %w[id title description]

        let(:id) { Product.create(title: 'foo', description: 'bar').id }
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
