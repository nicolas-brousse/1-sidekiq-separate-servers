class PygmentsJob < ActiveJob::Base
  queue_as :default

  def perform(snippet)
    uri = URI.parse('http://pygments.simplabs.com/')
    response = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.plain_code)
    sleep 10
    snippet.update_attribute(:highlighted_code, response.body)
  end
end
