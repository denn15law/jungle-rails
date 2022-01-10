require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it "validates that Product created has a name, price, quantity and category" do
      @category = Category.new
      @category.id = 5
      @category.name = "test"

      @product = Product.new
      @product.name = "testProduct"
      @product.price = 30000
      @product.quantity = 20
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new
      @category.id = 5
      @category.name = "test"

      @product = Product.new
      @product.name = nil
      @product.price = 30000
      @product.quantity = 20
      @product.category_id = @category

      @category.products = [@product]
      @product.save
      
      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @category = Category.new
      @category.id = 5
      @category.name = "test"

      @product = Product.new
      @product.name = 'testProduct'
      @product.price = nil
      @product.quantity = 20
      @product.category_id = @category

      @category.products = [@product]
      @product.save

      expect(@product.errors.full_messages[1]).to eql("Price is not a number")
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new
      @category.id = 5
      @category.name = "test"

      @product = Product.new
      @product.name = 'testProduct'
      @product.price = 20000
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]
      @product.save

      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @category = Category.new
      @category.id = 5
      @category.name = "test"

      @product = Product.new
      @product.name = 'testProduct'
      @product.price = 20000
      @product.quantity = 20
      @product.category_id = nil
      @product.save

      @category = [@product]

      expect(@product.errors.full_messages[0]).to eql("Category can't be blank")
      expect(@product).to_not be_valid
    end
  end
end
