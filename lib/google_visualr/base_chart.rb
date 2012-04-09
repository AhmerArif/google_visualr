module GoogleVisualr

  class BaseChart
    include GoogleVisualr::Packages
    include GoogleVisualr::ParamHelpers

    attr_accessor :data_table

    def initialize(data_table, options={})
      @data_table = data_table
      send(:options=, options)
    end

    def options
      @options
    end

    def options=(options)
      @options = stringify_keys!(options)
    end

    # Generates JavaScript and renders the Google Chart in the final HTML output.
    #
    # Parameters:
    #  *div_id            [Required] The ID of the DIV element that the Google Chart should be rendered in.
    def to_js(element_id)
      js  = "\n<script type='text/javascript'>"
      js << "\n  google.load('visualization','1', {packages: ['#{package_name}'], callback: function() {"
      js << "\n    #{@data_table.to_js}"
      js << "\n    var chart = new google.visualization.#{class_name}(document.getElementById('#{element_id}'));"
      js << "\n    chart.draw(data_table, #{js_parameters(@options)});"
      js << "\n  }});"
      js << "\n</script>"

      js
    end
	
	def to_js_with_events(element_id)
      js  = "\n<script type='text/javascript'>"
      js << "\n  google.load('visualization','1', {packages: ['#{package_name}'], callback: function() {"
      js << "\n    #{@data_table.to_js}"
      js << "\n    var chart = new google.visualization.#{class_name}(document.getElementById('#{element_id}'));"
      js << "\n    chart.draw(data_table, #{js_parameters(@options)});"
	  js << "\n    add_events(data_table, chart);"
      js << "\n  }});"
      js << "\n</script>"

      js
    end
	
	def to_js_without_script(element_id)
      js = "\n  google.load('visualization','1', {packages: ['#{package_name}'], callback: function() {"
      js << "\n    #{@data_table.to_js}"
      js << "\n    var chart = new google.visualization.#{class_name}(document.getElementById('#{element_id}'));"
      js << "\n    chart.draw(data_table, #{js_parameters(@options)});"
      js << "\n  }});"

      js
    end
	
	def to_js_add_callback(element_id)
      js = "\n  google.load('visualization','1', {packages: ['#{package_name}'], callback: function() {"
      js << "\n    #{@data_table.to_js}"
      js << "\n    var chart = new google.visualization.#{class_name}(document.getElementById('#{element_id}'));"
      js << "\n    chart.draw(data_table, #{js_parameters(@options)});"
	  js << "\n	   google.visualization.events.addListener(chart, 'ready', myReadyHandler);"
      js << "\n  }});"

      js
    end
	

  end

end