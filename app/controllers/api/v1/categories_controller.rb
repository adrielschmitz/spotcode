module Api
  module V1
    # auto explicativa
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all
      end

      def show
        @category = Category.find(params[:id])
      end
    end
  end
end
