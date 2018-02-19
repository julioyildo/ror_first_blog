class CommentsController < ApplicationController
    
    before_action :find_post
    before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
    before_action :comment_owner, only: [:destroy, :edit, :update, :comment_owner]
   
   
    # CREATE NEW COMMENT
    def create
        @comment = @post.comments.create(params[:comment].permit(:content))
        @comment.admin_id = current_admin.id
        @comment.save

        if @comment.save 
            redirect_to post_path(@post)
        else
            render "new"

        end
            
    end


    # DELETE
    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end


    # EDIT
    def edit 

    end 


    # UDPATE
    def update 
        if @comment.update(params[:comment].permit(:content))
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end 




    # PRIVATE
    private 

    def find_post
        @post = Post.find(params[:post_id])
        
    end

    def find_comment 
        @comment = @post.comments.find(params[:id])
    end

    def comment_owner
        unless current_admin.id = @comment.admin_id
        flash[:notice] = "Vous n'êtes pas autorisé sur cette page"
        redirect_to @post
        end

    end
  
   

end
