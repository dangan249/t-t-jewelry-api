class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :gender, :brand, :category, :image_url, :thumbnail_url

  has_many :values

  def values
    object.property_values.map do |prop_value|

      if prop_value.type == 'SimpleValue'
        {
            id: prop_value.id,
            name: prop_value.property.name,
            value: prop_value.value
        }
      else
        {
            id: prop_value.id,
            name: prop_value.property.name,
            value: prop_value.values.pluck(:value)
        }
      end
    end
  end

  def brand
    object.brand.name
  end

  def category
    object.category.name
  end
end
