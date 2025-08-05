local monitor = peripheral.wrap("right")
term.redirect(monitor)

if not monitor then
  print("No monitor found.")
  return
end

monitor.setTextScale(0.5)
monitor.setBackgroundColor(colors.black)
monitor.clear()

local image = paintutils.loadImage("image.nfp")

paintutils.drawImage(image, 1, 1)