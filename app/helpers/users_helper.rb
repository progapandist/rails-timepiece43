module UsersHelper
  def user_avatar_or_stub(user)
    if user.avatar?
      avatar =  user.avatar.path
    else
      avatar =  "zwlbzgaokjnprpwm9puw"
    end
  end
end
