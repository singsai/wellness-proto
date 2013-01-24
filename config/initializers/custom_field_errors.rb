require 'hpricot'
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(input|label|textarea|select)/
    error_class = 'field_with_errors_custom'
    nodes = Hpricot(html_tag)    
    nodes.each_child { |node| node[:class] = node.classes.push(error_class).join(' ') unless !node.elem? || node[:type] == 'hidden' || node.classes.include?(error_class) }
    #nodes.each_child { |node| node.search("</label>").append("*") unless !node.elem? || node[:type] == 'hidden' }
    # nodes.search("</label>").append("*")
    
    # nodes.search('</label>') do |link|        
    #     link.after "*"
    # end    
    
    
    node_html = nodes.to_html
  else
    html_tag
  end
  node_html.html_safe
end


# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#   errors = Array(instance.error_message).join(',')
#   %(#{html_tag}<span class="validation-error">&nbsp;#{errors}</span>).html_safe
# end