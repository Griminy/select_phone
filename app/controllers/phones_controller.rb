class PhonesController < ApplicationController
  
  # respond_to :html, :js

  def select_phone
    @brands = get_brands
    @brand_models = []
  end

  def get_models_for_select
    @brand_models = []
    brand_page = params[:brand_page]
    if brand_page
      page = Nokogiri::HTML(open("http://www.gsmarena.com/#{brand_page}"))
      page.css('.makers li').each do |model_info|
        @brand_models << [model_info.css('span').text.capitalize,
                          model_info.css('a').attr('href').text]
      end
    end
    puts "***********************************"
    puts @brand_models.inspect
    puts "***********************************"
    respond_to do |format|
      format.js
    end
  end

  def get_phone_info
    @categories = []
    @titles = []
    @info = []
    phone_page = params[:phone_page]
    if phone_page
      page = Nokogiri::HTML(open("http://www.gsmarena.com/#{phone_page}"))
      page.css('table').each do |table|
        @categories << table.css('th').text
        
        titles = []
        table.css('.ttl').each do |title|
          titles << title.text
        end
        @titles << titles

        info = []
        table.css('.nfo').each do |i|
          info << i.text
        end
        @info << info
      end
    end
    puts "***********************************"
    puts @categories.inspect
    puts @titles.inspect
    puts @info.inspect
    puts "***********************************"
    respond_to do |format|
      format.js
    end
  end


  private

  def get_brands
    brands = []
    page = Nokogiri::HTML(open("http://www.gsmarena.com/makers.php3"))
    page.css('.st-text td').each do |brand_info|
      brands << [brand_info.text.gsub(/[0-9]/, '').gsub(/\s.+/, '').capitalize,
                 brand_info.css('a').attr('href').text]
    end
    brands
  end
end