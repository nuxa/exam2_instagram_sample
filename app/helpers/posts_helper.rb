module PostsHelper
  def post_img(post)
    if post.image?
      img_url = post.image
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url)
  end
end
