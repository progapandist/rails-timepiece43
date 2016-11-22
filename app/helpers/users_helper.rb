module UsersHelper
  def user_avatar_or_stub(user)
    if user.avatar?
      avatar =  user.avatar.path    
    elsif current_user.facebook_picture_url?
      avatar = current_user.facebook_picture_url
    else
      avatar =  "zwlbzgaokjnprpwm9puw"
    end
  end
end
