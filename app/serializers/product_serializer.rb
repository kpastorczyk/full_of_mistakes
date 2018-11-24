class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :price

  def price
    object.price.round(3)
  end
end
