class ContentController < ApplicationController
  def faq
    @faqs = Faq.all.order('sequence ASC')
  end

  def sponsors
    @sponsors = Sponsor.all.order('sequence ASC')
  end
end
