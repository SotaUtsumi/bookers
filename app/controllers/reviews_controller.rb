class ReviewsController < ApplicationController
    before_action :set_review, only: %i[ show edit update destroy]

    def index
        @reviews = Review.all.order(created_at: :desc)
    end

    def show
    end
    
    def new
         @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to @review, notice: "感想を投稿しました。"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @review.update(review_params)
            redirect_to @review, notice: "感想を更新しました。"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
        redirect_to reviews_url, notice: "感想を削除しました。"
    end

    private

    def set_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :author, :body, :rating, :image)
    end
end
