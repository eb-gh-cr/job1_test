class Api::ProductsController < ApplicationController
  def index
    @items = Item.select(:id, :name, :description, :price).all
    render json: {data: @items}, status: :ok
  end
end
