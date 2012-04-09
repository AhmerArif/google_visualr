module GoogleVisualr

  module Rails

    module ViewHelper

      extend ActiveSupport::Concern

      included do
        helper_method "render_chart"
		helper_method "render_chart_with_events"
        helper_method "render_chart_without_script"
        helper_method "render_chart_with_callback"
        helper_method "render_chart_with_transition"
      end

      def render_chart(chart, dom)
        chart.to_js(dom).html_safe
      end
	  
	  def render_chart_with_events(chart, dom)
        chart.to_js_with_events(dom).html_safe
      end
	  
	  def render_chart_without_script(chart, dom)
        chart.to_js_without_script(dom).html_safe
      end

	  def render_chart_with_callback(chart, dom)
        chart.to_js_add_callback(dom).html_safe
      end

	  def render_chart_with_transition(chart, dom)
        chart.to_js_add_transition(dom).html_safe
      end
	  
    end

  end

end
