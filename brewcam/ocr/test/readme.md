# https://stackabuse.com/pytesseract-simple-python-optical-character-recognition/
pip install pipenv
mkdir ocr_server && cd ocr_server && pipenv install --three
pipenv shell
pipenv install pytesseract Pillow 
#Note: In that case, instead of pipenv install Pillow, the command will be pip install Pillow.

pipenv install Flask

python3 app.py