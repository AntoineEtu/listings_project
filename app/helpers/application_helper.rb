module ApplicationHelper
  def locale_select(lang)
    out = "<select class='form-control pull-right language' data-do='setLocale'>"
    I18n.available_locales.each do|loc|
     out += "<option value='#{url_for(locale: loc.to_s)}' #{'selected' if lang == loc }>#{loc}</option>"
    end
    out += "</select>"
    out.html_safe
  end
end
