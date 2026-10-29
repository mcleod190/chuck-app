module ApplicationHelper
  def scene_image_path(joke)
    return "" unless joke&.image_url.present?
    if joke.image_url.start_with?("chuck/", "scenes/")
      joke.image_url
    else
      "scenes/#{joke.image_url}"
    end
  end

  def scene_image_tag(joke, options = {})
    classes = options[:class] || "w-full h-auto object-cover rounded-lg"
    path = scene_image_path(joke)
    
    if path.present?
      image_tag path, alt: joke.movie_title, class: classes, **options.except(:class)
    else
      content_tag :div, class: "flex items-center justify-center bg-slate-900 border border-amber-500/30 rounded-lg p-6 text-center text-amber-300" do
        content_tag(:span, "🥋 #{joke.movie_title}")
      end
    end
  rescue => _e
    content_tag :div, class: "flex items-center justify-center bg-slate-900 border border-amber-500/30 rounded-lg p-6 text-center text-amber-300" do
      content_tag(:span, "🥋 #{joke.movie_title}")
    end
  end

  def category_badge_color(category)
    case category
    when "Movie Legends"
      "bg-amber-500/20 text-amber-300 border-amber-500/40"
    when "Texas Ranger Grit"
      "bg-orange-500/20 text-orange-300 border-orange-500/40"
    when "Martial Arts"
      "bg-rose-500/20 text-rose-300 border-rose-500/40"
    when "Physics & Cosmos"
      "bg-cyan-500/20 text-cyan-300 border-cyan-500/40"
    else
      "bg-emerald-500/20 text-emerald-300 border-emerald-500/40"
    end
  end
end



