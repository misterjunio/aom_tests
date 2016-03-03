class PropertiesController < ApplicationController
  def create
    property_type = PropertyType.find(property_params[:property_type_id])
    @property = property_type.properties.build(property_params)
    if @property.save
      redirect_to show_path
    else
      redirect_to root_url
    end
  end

  private

    def property_params
      params.require(:property).permit(:value, :entity_id, :property_type_id)
    end
end