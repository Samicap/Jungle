require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "has a name" do
      @category = Category.new({name: "name"})
      @product = Product.new({name: 'John', quantity: 400, price: 300, category: @category})
      @product.save

      expect(@product.name).not_to be_empty
      
    end

    it "has an error message" do
      @category = Category.new({name: "name"})
      @product = Product.new({name: 'John', quantity: nil, price: 300, category: @category})
      @product.save
      
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to eq ["can't be blank"]
      
    end

    it "has a price" do
      @category = Category.new({name: "name"})
      @product = Product.new({name: 'John', quantity: 400, price: 300, category: @category})
      @product.save

      expect(@product.price).to be == 300
    end

    it "has a category" do
      @category = Category.new({name: "name"})
      @product = Product.new({name: 'John', quantity: 400, price: 300, category: @category})
      @product.save
  
      expect(@product.category).to be == @category
    end

    it "has a quantity" do
      @category = Category.new({name: "name"})
      @product = Product.new({name: 'John', quantity: 400, price: 300, category: @category})
      @product.save
  
      expect(@product.quantity).to be == 400
    end

    
  end
end
