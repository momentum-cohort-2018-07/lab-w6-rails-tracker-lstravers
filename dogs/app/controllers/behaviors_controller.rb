class BehaviorsController < ApplicationController

  before_action :set_dog,  only: [:index, :create, :show, :update, :destroy]
    before_action :set_behavior, only: [:show, :update, :destroy]

  
    def index
      @behaviors = @dog.behaviors
      
  
      render json: @dog.behaviors
    end
  
   
    def show
      render json: @behavior
    end
  

    
    def create
     
      @behavior = Behavior.create(
          behaviors: params["behaviors"],
          dog_id: @dog.id
          )
    
  
        render json: @behavior
    end
  
    
    def update
      if @behavior.update(behavior_params)
        render json: @behavior
      else
        render json: @behavior.errors, status: :unprocessable_entity
      end
    end
  
    
    def destroy
      @behavior.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dog
        @dog = Dog.find(params["dog_id"])
      end

      def set_behavior
        @behavior= Behavior.find(params["id"])
      end
  
      # Only allow a trusted parameter "white list" through.
      def behavior_params
        params.require(:behavior).permit(:behaviors)
      end
end
