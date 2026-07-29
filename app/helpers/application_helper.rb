module ApplicationHelper
  def nav_link_to(name, path, active_paths: [])
    active = current_page?(path) || active_paths.any? { |active_path| current_page?(active_path) }
    classes = [
      "nav-link",
      active ? "nav-link-active" : ""
    ].join(" ")

    link_to name, path, class: classes
  end

  def role_label(user)
    user.admin? ? "Administrador" : "Estudante"
  end

  def number_to_level_progress(progress)
    "#{progress[:percentage]}%"
  end
end
