class LikesController < ApplicationController
    before_action :find_like, only: [:destroy]
    before_action :find_course

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @course.likes.create(user_id: current_user.id)
        end
        redirect_to course_path(@course)
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        redirect_to course_path(@course)
    end

    def find_like
        @like = @course.likes.find(params[:id])
    end
    
    private
        def already_liked?
            Like.where(user_id: current_user.id, course_id:
            params[:course_id]).exists?
        end
        

        def find_course
            @course = Course.find(params[:course_id])
            
        end
end
