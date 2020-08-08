# tesseract
https://hub.docker.com/r/clearlinux/tesseract-ocr
https://pypi.org/project/pytesseract/

# data
https://github.com/tesseract-ocr/tessdata

# commands?

# https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage

```bash
# tesseract <imgSource>  <outputfilepath> <-options>
tesseract images/eurotext.png output/eurotext-eng -l eng --psm 13
```


# modes
```bash
Page segmentation modes:
  0    Orientation and script detection (OSD) only.
  1    Automatic page segmentation with OSD.
  2    Automatic page segmentation, but no OSD, or OCR.
  3    Fully automatic page segmentation, but no OSD. (Default)
  4    Assume a single column of text of variable sizes.
  5    Assume a single uniform block of vertically aligned text.
  6    Assume a single uniform block of text.
  7    Treat the image as a single text line.
  8    Treat the image as a single word.
  9    Treat the image as a single word in a circle.
 10    Treat the image as a single character.
 11    Sparse text. Find as much text as possible in no particular order.
 12    Sparse text with OSD.
 13    Raw line. Treat the image as a single text line,
       bypassing hacks that are Tesseract-specific.
OCR Engine modes: (see https://github.com/tesseract-ocr/tesseract/wiki#linux)
  0    Legacy engine only.
  1    Neural nets LSTM engine only.
  2    Legacy + LSTM engines.
  3    Default, based on what is available.
```
## build
```bash
docker build -t ocr .
```

## shell

```bash
docker run -it \
-v "$PWD"/images:/workspace/images \
-v "$PWD"/output:/workspace/output \
ocr \
bash
```

## test

```bash
docker run -it \
-v "$PWD"/images:/workspace/images \
-v "$PWD"/output:/workspace/output \
ocr \
tesseract images/eurotext.png output/eurotext-eng -l eng
```

# test2

```bash
docker run -it \
-v "$PWD"/images:/workspace/images \
-v "$PWD"/output:/workspace/output \
ocr \
tesseract images/sample.png output/sample -l eng --psm 13
```