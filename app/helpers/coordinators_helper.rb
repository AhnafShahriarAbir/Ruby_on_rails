module CoordinatorsHelper

  # Returns the Gravatar for the given coordinator.
  def gravatar_for_coor(coordinator, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(coordinator.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: coordinator.given_name, class: "gravatar")
  end
end