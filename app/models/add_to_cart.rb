class AddToCart
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :product_id, :quantity
  validates :product_id, :presence => true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def initialize(params = {})
    @product_id = params[:product_id]
    @quantity = params[:quantity]
  end

  def persisted?
    false
  end
end
