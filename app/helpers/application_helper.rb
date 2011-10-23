module ApplicationHelper
  # Return an image tag of user's avatar if she has one
  # or her username otherwise.
  #
  # avatar_version is accepted as the only parameter
  # for requiring special avatar versions.
  def show_avatar_or_username(avatar_version = nil)
    if current_user.avatar?
      image_tag(current_user.avatar_url(avatar_version),
                :alt => current_user.username)
    else
      current_user.username
    end
  end
end
