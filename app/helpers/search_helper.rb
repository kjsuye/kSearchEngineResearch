module SearchHelper
  class GoogleCustomSearch

    #code for connecting to google search api
    def self.initialize_search
      @my_search_client = Google::APIClient.new(
        key: "AIzaSyBm4SI-YBz-XiskkmfZVb5LXvO_jLi8pfQ" , authorization: nil)
      @google_search = @my_search_client.discovered_api("customsearch")
#    response = my_search_client.execute(google_search.cse.list, 'q' => 'hello world')
    end

    def self.execute_query(query)
      if @google_search.nil?
        self.initialize_search
        @response = @my_search_client.execute(api_method: @google_search.cse.list,
          parameters: {q: query,
                     key: "AIzaSyBm4SI-YBz-XiskkmfZVb5LXvO_jLi8pfQ",
                      cx: "000177987223272125020:4z21ktdyx88"})
      else
      @response = @my_search_client.execute(api_method: @google_search.cse.list,
        parameters: {q: query,
                     key: "AIzaSyBm4SI-YBz-XiskkmfZVb5LXvO_jLi8pfQ",
                     cx: "000177987223272125020:4z21ktdyx88"})
      end
    end

    def self.get_response
      return @response
    end

    def self.clear_results
      @response = nil
    end

  end
end
