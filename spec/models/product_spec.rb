require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do

      it 'should save when every criteria is meet' do
        @category = Category.create(name: "Tested")
        @product = Product.new
        @product.name = 'test_Product'
        @product.description = 'testing stuff'
        @product.category = @category
        @product.quantity = 5
        @product.price = 5000
        expect(@product.save).to be_truthy
      end
      it 'not save when name is missing ' do 
        @category = Category.create(name: "Tested")
        @product = Product.new
        @product.description = 'testing stuff'
        @product.category = @category
        @product.quantity = 5
        @product.price = 5000
        expect(@product.save).to be_falsey
      end
      it 'not save when price is missing ' do 
        @category = Category.create(name: "Tested")
        @product = Product.new
        @product.name = 'test_Product'
        @product.description = 'testing stuff'
        @product.category = @category
        @product.quantity = 5
        expect(@product.save).to be_falsey
      end
      it 'should not save when quantity is missing' do
        @category = Category.create(name: "Tested")
        @product = Product.new
        @product.name = 'test_Product'
        @product.description = 'testing stuff'
        @product.category = @category
        @product.price = 5000
        expect(@product.save).to be_falsey
      end
      it 'should not save when catergory is missing' do
        @product = Product.new
        @product.name = 'test_Product'
        @product.description = 'testing stuff'
        @product.quantity = 5
        @product.price = 5000
        expect(@product.save).to be_falsey
      end
      
    end
end
