module WikisHelper
	def markdown(text)
		@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
		no_intra_emphasis: true, 
		fenced_code_blocks: true,   
		disable_indented_code_blocks: true,
		autolink: true,
		space_after_headers: true,
		underline: true,
		highlight: true,
		footnotes: true,
		tables: true })
		@markdown.render(text).html_safe
	end

	def wiki_has_collaborators?
		@wiki.collaborators.any?
	end
end
