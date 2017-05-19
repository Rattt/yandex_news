class YandexArticleDownloadJob < ApplicationJob
  queue_as :default

  def perform
    article = Article.new article_params
    article.save!
  end

  private

  def article_url
    body = HttpService.new('https://www.yandex.ru/').perform_get
    html = Nokogiri::HTML body
    article_links_xpath = '//div[@id="tabnews_newsc"]//li[@class="list__item"]/a'
    article_link = html.xpath(article_links_xpath).first
    article_link[:href]
  end

  def article_params
    body = HttpService.new(article_url).perform_get
    html = Nokogiri::HTML body
    title_xpath = '//h1[@class="story__head"]'
    title = html.xpath(title_xpath).first.text

    annotation_xpath = '//div[@class="doc__text"]/span[@class="rich-text"]'
    annotation = html.xpath(annotation_xpath).first.text

    { title: title, annotation: annotation }
  end
end
