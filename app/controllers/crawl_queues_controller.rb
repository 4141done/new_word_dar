class CrawlQueuesController < ApplicationController
  def index
    @queues = CrawlQueue.all
  end
end