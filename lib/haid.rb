# frozen_string_literal: true

require_relative "haid/version"
require 'sanitize'

module Haid
  class Error < StandardError; end
  def self.html_gen(content, file_name: 'index.html', bypass_html: false)
    content = Sanitize.fragment(content) unless bypass_html
    File.open(file_name, 'w+') do |file|
      html = <<-HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <title>#{file_name}</title>
        </head>
        <body>
          <div class="content">
            #{content}
          </div>
        </body>
        </html>
      HTML
      file.write(html)
    end
  end
end
