class EntitiesController < ApplicationController
  def create
    entity_type = EntityType.find(entity_params[:entity_type_id])
    @entity = entity_type.entities.build(entity_params)
    if @entity.save
      redirect_to show_path
    else
      redirect_to root_url
    end
  end

  private

    def entity_params
      params.require(:entity).permit(:value, :entity_type_id)
    end
end