from django.shortcuts import render,HttpResponse
from backend.models import developer
from backend.models import doctor
from django.contrib import messages as message
from datetime import datetime
from django.contrib.messages import constants
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password,check_password
from django.contrib.messages import constants as messages
# Create your views here.
from django.shortcuts import render
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import pickle
import os
from operator import itemgetter    
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')
# get_ipython().magic(u'matplotlib inline')
plt.style.use('ggplot')

from sklearn.model_selection import StratifiedShuffleSplit

from sklearn.tree import DecisionTreeRegressor
from sklearn import preprocessing
from pandas.plotting import scatter_matrix
from sklearn.preprocessing import RobustScaler, StandardScaler, LabelEncoder, MinMaxScaler, OneHotEncoder, LabelBinarizer
from sklearn.metrics import mean_squared_error, accuracy_score, mean_absolute_error
#from sklearn.cross_validation import KFold, cross_val_score
from sklearn.model_selection import cross_val_score, GridSearchCV, RandomizedSearchCV, KFold, cross_val_predict, StratifiedKFold, train_test_split, learning_curve, ShuffleSplit
from sklearn.model_selection import train_test_split
from sklearn import model_selection, preprocessing
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
from sklearn.model_selection import cross_val_score, GridSearchCV, RandomizedSearchCV,KFold, cross_val_predict, StratifiedKFold, train_test_split, learning_curve, ShuffleSplit
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC 
from sklearn.linear_model import SGDClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV, ShuffleSplit
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score, f1_score
from sklearn.model_selection import cross_val_predict
from sklearn.metrics import confusion_matrix
from sklearn.metrics import precision_recall_curve, average_precision_score, auc
#from sklearn.utils.fixes import signature
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score
from django.core.files import File
# Create your views here.
def index(request):
    return render(request,'index.html')
def predict(request):
    # file=request.POST['database']
    # print(file[:5])
    data=pd.read_csv('database.csv')
    data.sample(frac = 1)
    y = data['y']
    XNorm = data.drop('y',axis=1)
    f = open('model.pkl','rb')
    model = pickle.load(f)

    accuracy_per_batch = []
    for i in np.arange(500,len(XNorm),500):
        y1 = model.predict(XNorm[:i])
        acc = accuracy_score(y[:i],y1)
        accuracy_per_batch.append(acc)

    prediction = model.predict(XNorm)
    conf_mx = confusion_matrix(y,prediction)

    def plot_confusion_matrix(cm,target_names,title='Confusion Matrix',cmap=None,
                            normalize=False):
        import itertools
        accuracy = np.trace(cm) / float(np.sum(cm))
        misclass = 1 - accuracy

        if cmap is None:
            cmap = plt.get_cmap('Blues')

        plt.figure(figsize=(8, 6))
        plt.imshow(cm, interpolation='nearest', cmap=cmap)
        plt.title(title)
        plt.colorbar()

        if target_names is not None:
            tick_marks = np.arange(len(target_names))
            plt.xticks(tick_marks, target_names, rotation=45)
            plt.yticks(tick_marks, target_names)

        if normalize:
            cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
            
        thresh = cm.max() / 1.5 if normalize else cm.max() / 2
        for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
            if normalize:
                plt.text(j, i, "{:0.4f}".format(cm[i, j]),
                        horizontalalignment="center",
                        color="white" if cm[i, j] > thresh else "black")
            else:
                plt.text(j, i, "{:,}".format(cm[i, j]),
                        horizontalalignment="center",
                        color="white" if cm[i, j] > thresh else "black")


        plt.tight_layout()
        plt.ylabel('True label')
        plt.xlabel('Predicted label')
        # plt.show()
        plt.savefig('static/confusion.png')


    plot_confusion_matrix(conf_mx, 
                        normalize    = False,
                        target_names = [0,1,2,3],
                        title        = "Confusion Matrix")



    batches = np.arange(500,len(XNorm),500)

    plt.figure(figsize=(20,10))
    plt.plot(batches,accuracy_per_batch)
    plt.xlabel("Batches")
    plt.ylabel("Accuracy")
    # plt.show()
    plt.savefig('static/test.png')
    return render(request,'graphs.html')


def about(request):
    return render(request,'about page.html')

def home(request):
    return render(request,'home.html')

def login(request):
    return render(request,'login.html')

def developer_login(request):
    if request.method == 'POST' :
        user=request.POST['username']
        psw=request.POST['password']
        auth=authenticate(username=user,password=psw)
        if auth is not None:
            return render(request,'developer.html')
        else:
            message.add_message(request, messages.INFO, 'Incorrect password/username !!!')
            return render(request,'login.html')
    else :
        return HttpResponse("404 - not found")

def doctor_login(request):
    
    if request.method == 'POST':
        user=request.POST['username']
        psw=request.POST['password']
        auth=doctor.objects.get(user_name=user)        
        # print(auth)
        if auth is not None and check_password(psw,auth.password):
            return render(request,'doc_page.html')
        else :
            message.add_message(request, messages.INFO, 'Incorrect password/username !!!')
            return render(request,'login.html')
    else :
        return HttpResponse("404 - not found")

def doctor_signup(request):
    if request.method=='POST':
        name=request.POST['fname']+request.POST['lname']
        position=request.POST['position']
        age=request.POST['age']
        experience = request.POST.get('experience', False)
        repsw=request.POST['re_password']
        psw=request.POST['password']
        user_name=request.POST['pseudo']
        user=doctor(position=position,name=name,user_name=user_name,password=make_password(psw),age=age,experience=experience)
        user.save()
        return render(request,'login.html')
    else:
        return HttpResponse("404 - not found")
def doctor_signup_page(request):
    return render(request,'doc_register.html')