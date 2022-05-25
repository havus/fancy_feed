# frozen_string_literal: true

module API
  module V1
    class ArticlesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        new_article = Article.new(permitted_params)

        if new_article.save
          # Article.all.each { |art| ActionCable.server.broadcast 'all_articles', art }
          ActionCable.server.broadcast('all_articles', new_article)

          render json: new_article.to_json, status: :ok
        else
          render json: { errors: new_article.errors.full_messages }, status: 422
        end
      end

      private

      def permitted_params
        params.require(:article).permit(:title, :content, :user_id)
      end
    end
  end
end
