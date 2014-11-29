class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :gender, :brand, :category, :image_url

  has_many :values

  def values
    object.property_values.map do |prop_value|

      if prop_value.type == 'SimpleValue'
        {prop_value.property.name => prop_value.value }
      else
        {prop_value.property.name => prop_value.values.pluck(:value)}
      end
    end
  end

end
