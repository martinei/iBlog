atom_feed do |feed|
  feed.title "Wochenstatus"
  feed.updated @statuses.first.updated_at if @statuses.first
  feed.subtitle "weekly internal innoQ blog"
  feed.generator "i-Blogs Custom ATOM Feed Generator 1.0", :uri => root_url
  feed.link href: url_for(only_path: false), rel: 'first'
  feed.link href: url_for(only_path: false, params: Rack::Utils.parse_query(URI(path_to_next_page(@statuses)).query)), rel: 'next' if path_to_next_page(@statuses)
  feed.link href: url_for(only_path: false, params: Rack::Utils.parse_query(URI(path_to_prev_page(@statuses)).query)), rel: 'previous' if path_to_prev_page(@statuses)

  @statuses.each do |status|
    feed.entry status do |entry|
      entry.title status.title
      entry.summary :type => "html" do |html|
        html.cdata! status.status_html
      end
      entry.content :type => "html", :"xml:lang" => "en", :"xml:base" => root_url do |html|
        html.cdata! status.status_html
      end
      entry.author do |author|
        author.name status.author.name
        author.uri weekly_statuses_by_author_path(status.author.handle)
      end
    end
  end
end
