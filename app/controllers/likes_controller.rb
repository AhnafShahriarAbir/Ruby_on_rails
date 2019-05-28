class LikesController < ApplicationController
    before_action :find_course
    before_action :find_like, only: [:destroy]

    def create
        if already_liked? || already_unliked?
            flash[:danger] = "You can't vote more than once"
        else
            @course.likes.create(user_id: current_user.id)
        end
        redirect_to courses_url
    end

    def destroy
        @likes.destroy
    end

    def find_like
        @like = @course.likes.find(params[:id])
    end

    private
        def already_liked?
            Like.where(user_id: current_user.id, course_id:
            params[:course_id]).exists?
        end

        def already_unliked?
            Unlike.where(user_id: current_user.id, course_id:
            params[:course_id]).exists?
        end
        def find_course
            @course = Course.find(params["course_id"])
        end
end
