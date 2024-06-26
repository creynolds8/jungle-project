class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  def show
    @product_count = Product.sum(:id)
    @category_count = Category.sum(:id)
  end
end
