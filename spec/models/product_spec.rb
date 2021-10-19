require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with valid attributes' do
      category = Category.new(name: 'test')
      product = Product.new(name: 'test', price: 10, quantity: 25, category: category)
      expect( product).to be_valid
    end

    it "invalid when name is nil" do
      @product = Product.new
      @product.name = nil 
      @product.valid?
      expect(@product.errors.full_messages).to  include("Name can't be blank")
    end
  
    it "invalid when price is nil" do
      @product = Product.new
      @product.price_cents = nil  
      @product.valid?
      expect(@product.errors.full_messages).to  include("Price can't be blank")
    end
    it "invalid when quantity is nil" do
      @product = Product.new
      @product.quantity = nil # invalid state
      @product.valid?
      expect(@product.errors.full_messages).to  include("Quantity can't be blank")
    end
    it "has category_id" do
      @cat = Category.new
      @product = Product.new
      @product.category = nil 
      @product.valid?
      expect(@product.errors.full_messages).to  include("Category can't be blank")
    end


  end
end