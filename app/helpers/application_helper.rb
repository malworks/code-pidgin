module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-errr' if errors.any?

    content_tag :div, capture(&block), class: css_class
  end

  #def avatar_url(user)
   #gravatar_id = Digest::MD5::hexdigest(user.email).downcase
   #{}"http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
 #end

 def markdown(text)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            strikethrough: true,
            lax_html_blocks: true,
            superscript: true,
            tables: true,
            underline: true,
            highlight: true
        }
        Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    end
end
