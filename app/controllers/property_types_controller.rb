class PropertyTypesController < ApplicationController
  def create
    entity_type = EntityType.find(property_type_params[:entity_type_id])
    @property_type = entity_type.property_types.build(property_type_params)
    if @property_type.save
      redirect_to show_path
    else
      redirect_to root_url
    end
  end

  private

    def property_type_params
      params.require(:property_type).permit(:name, :entity_type_id)
    end
end