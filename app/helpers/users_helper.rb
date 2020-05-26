module UsersHelper
  def choosed_image(item)
    if item.persisted? 
      item.images.each_with_index do |image, i| 
        return image_tag image.src.url, data: { index: i }, width: "100", height: '100' 
      end
    end
  end
end
