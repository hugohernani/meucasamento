module Wedding
  module Events
    module Blog
      class PostsController < Wedding::BaseController

        def show
          @post = @current_event.blog.posts.find(params[:id])
          @previous_post = @post.class.where('id < ?', @post.id).first
          @next_post = @post.class.where('id > ?', @post.id).first
        end
      end
    end
  end
end
