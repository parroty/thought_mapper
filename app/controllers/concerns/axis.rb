module Axis
  def process_create(object, notice)
    respond_to do |format|
      if object.save
        path   = topic_path(object.topic)
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :new, topic_id: object.topic.id }
      end
    end
  end

  def process_update(object, input_params, notice)
    respond_to do |format|
      if object.update(input_params)
        path   = topic_path(object.topic)
        notice = "The view point '#{object.title}' was updated."
        format.html { redirect_to path, notice: notice }
      else
        format.html { render :edit, topic_id: object.topic.id }
      end
    end
  end

  def process_destroy(object, notice)
    object.destroy
    respond_to do |format|
      path   = topic_path(object.topic)
      format.html { redirect_to path, notice: notice }
    end
  end
end
