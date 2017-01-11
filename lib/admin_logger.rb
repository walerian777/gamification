module AdminLogger
  def self.log(message)
    @@log ||= File.open('./log/admin_access.log', 'a')
    @@log.write("#{DateTime.current}: #{message}\n")
    @@log.close
  end
end
