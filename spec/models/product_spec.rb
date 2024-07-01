require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do
    before :each do
      @category = Category.new name: "TEST"
    end
    it "should validate name value" do
      @product = @category.products.new quantity: 4, price: 24.99
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should validate price value" do
      @product = @category.products.new name: "TEST PRODUCT", quantity: 4
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "should validate quantity value" do
      @product = @category.products.new name: "TEST PRODUCT", price: 24.99
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should validate category value" do
      @product = Product.new name: "TEST PRODUCT", quantity: 4, price: 24.99
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "is valid if all fields are valid" do
      @product = @category.products.new name: "TEST PRODUCT", quantity: 4, price: 24.99
      @product.save!
      expect(@product).to be_valid
    end
  end

end
