class EatsController < ApplicationController
    def index
        @eats = Eat.all
    end
    def new
        @eat = Eat.new
      end
    
      def create
        eat = Eat.new(eat_params)
        if eat.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def eat_params
        params.require(:eat).permit(:price, :station, :body)
      end
    end
