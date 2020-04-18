module Api
  module V1
    # classe autoexplicativa
    class FavoritesController < ApplicationController
      def index
        @favorite_albums = find_favorite('Album')
        @favorite_songs = find_favorite('Song')
        @favorite_artists = find_favorite('Artist')
      end

      def create
        currrent_user.favorites.create(favoritable_type: params[:favoritable_type], favoritable_id: params[:id])
        head :ok
      end

      def destroy
        @favoritable = current_user
                         .favorites
                         .find_by(favoritable_type: params[:favoritable_type], favoritable_id: params[:id])
        @favoritable.destroy
        head :ok
      end

      private

      def find_favorite(type)
        current_user.favorites.where(favoritable_type: type).map(&:favoritable)
      end
    end

  end
end
