module Rankable
  extend ActiveSupport::Concern

  included do
    include Redis::Objects

    sorted_set(:daily_rank, global: true)
    sorted_set(:weekly_rank, global: true)
    sorted_set(:monthly_rank, global: true)
    sorted_set(:all_time_rank, global: true)
  end
end
