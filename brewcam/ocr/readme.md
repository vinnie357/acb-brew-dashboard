# tesseract
https://hub.docker.com/r/clearlinux/tesseract-ocr

# data
https://github.com/tesseract-ocr/tessdata

# commands?
docker run --rm -it --name myapp -v "$PWD":/app -w /app clearlinux/tesseract-ocr tesseract xxx.tiff stdout --oem 1