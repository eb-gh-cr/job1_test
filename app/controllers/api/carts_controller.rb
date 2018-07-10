class Api::CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_or_create_cart

  def create
    add_to_cart = AddToCart.new(params)
    product = Product.find(add_to_cart.product_id)
    if add_to_cart.valid?
      @cart.add(product, product.price, add_to_cart.quantity)
      render json: {data: nil}, status: :ok
    else
      render json: {error: {params: add_to_cart.errors}}, status: :bad_request
    end
  end

  def delete
    render json: {data: nil}, status: :ok
  end

  def show
    render json: {data: @cart}, status: :ok
  end

  private

  def find_or_create_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
