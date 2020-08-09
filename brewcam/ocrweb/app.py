import os
from flask import Flask, render_template, request, redirect, url_for, send_from_directory

# import our OCR function
from ocr_core import ocr_core

# define a folder to store and later serve the images
UPLOAD_FOLDER = './uploads/'

# allow files of a specific type
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# function to check the file extension
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# route and function to handle the home page
@app.route('/')
def home_page():
    # return render_template('index.html')
    return redirect("/upload", code=302)
# route and function to handle the upload page
@app.route('/upload', methods=['GET', 'POST'])
def upload_page():
    if request.method == 'POST':
        # check if there is a file in the request
        if 'file' not in request.files:
            return render_template('upload.html', msg='No file selected')
        file = request.files['file']
        # if no file is selected
        if file.filename == '':
            return render_template('upload.html', msg='No file selected')

        if file and allowed_file(file.filename):
            # store file 
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], file.filename))
            # call the OCR function on it
            extracted_text = ocr_core(file)

            # extract the text and display it
            return render_template('upload.html',
                                   msg='Successfully processed',
                                   extracted_text=extracted_text,
                                   img_src=UPLOAD_FOLDER + file.filename)
            # return render_template('upload.html',
            #                        msg='Successfully processed',)
    elif request.method == 'GET':
        return render_template('upload.html')
# route and function to handle the image requests
@app.route('/uploads/<path:path>', methods=['GET'])
def send_image(path):
    return send_from_directory('uploads', path)

if __name__ == '__main__':
    app.run(host='0.0.0.0')