module WatchesHelper
  def watch_photo_or_stub(watch)
    if watch.photo?
      photo =  watch.photo.path
    else
      photo =  "qgkm1adckas5zjlw0fvh"
    end
    photo
  end
end
