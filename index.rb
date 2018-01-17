#! env ruby
require 'sinatra'
require 'redcarpet'

# Initializes a Markdown parser
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

running_path = Dir.pwd

find_pattern = File.join(running_path, '**/*.md')

md_files = Dir.glob(find_pattern)

p md_files

routes = []

md_files.each do |p|
    routes << p.gsub(running_path, '')
end

# p routes

get '/' do
    routes.map { |e| "<a href='#{e}'>#{e}</a><br>" }
 end

routes.each_with_index do |route, i|
    content = File.read md_files[i]
    get route do
        "<head><link rel='stylesheet' href='/css/air.css' type='text/css' /></head>
        <h1>#{route}</h1>" + markdown.render(content)
    end
end