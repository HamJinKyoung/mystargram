class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.user_id = current_user.id
    
    hashtags= params[:hashtags].split(" ")
    hashtags.each do |onetag|
      hashtag = Hashtag.find_or_create_by(name: onetag)
      hashtag.save
      @post.hashtags << hashtag
    end
    
    uploader = ImguploaderUploader.new
    uploader.store!(params[:img])
    @post.img_url = uploader.url
    
    @post.save
    
    redirect_to '/home/index'
  end
  
  def destroy
    post= Post.find(params[:post_id])
    post.destroy
    
    redirect_to '/home/index'
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.hashtags.clear
    hashtags= params[:hashtags].split(" ")
    hashtags.each do |onetag|
      hashtag = Hashtag.find_or_create_by(name: onetag)
      hashtag.save
      @post.hashtags << hashtag
    end
    
    @post.save
    
    redirect_to '/home/index'
  end
  
end
