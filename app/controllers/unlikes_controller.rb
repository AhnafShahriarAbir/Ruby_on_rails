class UnlikesController < ApplicationController
    before_action :find_course
    before_action :find_unlike, only: [:destroy]

    def create
        if already_unliked? || already_liked?
            flash[:danger] = "You can't vote more than once"
        else
            @course.unlikes.create(user_id: current_user.id)
        end
        redirect_to courses_url
    end

    def destroy
        @unlikes.destroy
        redirect_to course_path(@course)
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
