import pytesseract

image = file
text = pytesseract.image_to_string(image)
print(text)


