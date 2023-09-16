class CardcommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @cardcomment = task.cardcomments.build
    end

    def create
        task = Task.find(params[:task_id])
        @cardcomment = task.cardcomments.build(comment_params)
        if @cardcomment.save
            redirect_to task_path(task), notice: 'コメントを追加'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    private
    def comment_params
        params.require(:cardcomment).permit(:content)
    end
end