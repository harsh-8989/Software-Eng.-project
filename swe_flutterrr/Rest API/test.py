from flask import Flask, render_template, request, json
import numpy as np
from PIL import Image
import SWE as swe
model = {}

app = Flask(__name__, template_folder='template', static_url_path='/static')


@app.route("/")
def show_results():
    swe.plot_confusion()
    swe.save_condrft()

    return render_template('abc.html')


if __name__ == '__main__':
    app.run()
