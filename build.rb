require 'redcarpet'
require 'erb'
require 'byebug'


class MarkdownDirectoryCompiler
  @@output_dir = "compiled"
  @@html_boiler = "html_boiler.html.erb"
 
  class ErbCompiler
    def initialize(context={}) # variables available to ERB
      @context = context
    end
    def compile(filepath)
      ERB.new(File.read(filepath)).result(binding)
    end
  end
 
  def self.remove_contents_of_output_dir!
    `rm -rf #{@@output_dir}/*`
  end
  def self.create_file(path, text)
    File.open( path, 'w' ) do |file|
      file.write(text)
    end
  end
  def self.compile_directory(directory)
    remove_contents_of_output_dir!
#    generate_index(directory)
    Dir.glob("#{directory}/**/*").each do |path|
      if File.file?(path)
        compiled_text = html_with_boiler(path)
        compiled_filename = path
                            .gsub(directory, @@output_dir)
                            .gsub(".md", ".html")
        create_file(compiled_filename, compiled_text)
      else
        Dir.mkdir(path.gsub(directory, @@output_dir))
      end
    end
  end
  def self.html_with_boiler(filepath)
    compiled_markdown = markdown_to_html(File.read(filepath))
    ErbCompiler.new(
      compiled_markdown: compiled_markdown
    ).compile(@@html_boiler)
  end
  def self.markdown_to_html(text)
    html_renderer = Redcarpet::Render::HTML.new
    markdown_renderer = Redcarpet::Markdown.new(html_renderer)
    markdown_renderer.render(text)
  end
end

MarkdownDirectoryCompiler.compile_directory("published")