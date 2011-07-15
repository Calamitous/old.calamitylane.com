module Jekyll
  class Post
    def excerpt
      delimeter = @site.config['content_delimeter'] || '<!-- read more -->'
      self.content.split(delimeter)[0]
    end
  end

  AOP.around(Post, :to_liquid) do |post_instance, args, proceed, abort|
    result = proceed.call
    result['excerpt'] = post_instance.excerpt
    result
  end
end

