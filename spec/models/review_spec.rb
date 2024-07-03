require 'rails_helper'

RSpec.describe Review, type: :model do
  
  describe "Validations" do
    before :each do
      @category = Category.new name: "TEST"
      @product = @category.products.new name: "TEST PRODUCT", quantity: 4, price: 24.99
    end
    it "is valid if required fields are valid" do
      @product.reviews.new user_id: 1, rating: 4
      @product.save!
      expect(@product).to be_valid
    end
    it "validates the rating value" do
      @review = @product.reviews.new user_id: 1
      @review.valid?
      expect(@review.errors.full_messages).to include("Rating can't be blank")
    end
    it "validates the user_id value" do
      @review = @product.reviews.new rating: 1
      @review.valid?
      expect(@review.errors.full_messages).to include("User can't be blank")
    end
  end
end
