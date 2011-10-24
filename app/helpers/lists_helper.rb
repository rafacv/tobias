module ListsHelper
  # Return strings 'public' or 'private'
  # whether the list is public or not
  def public_list?(list)
    list.public ? "public" : "private"
  end

  # Return a cycle object if an iterable
  # is given as argument and it's not a string.
  # Return the very object otherwise.
  def cycle_on_iterable(options)
    if not options.is_a?(String) and options.respond_to?(:length) and options.length > 1
      cycle(*options)
    else
      options
    end
  end
end
