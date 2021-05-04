from sklearn.svm import SVC
from sklearn.metrics import roc_auc_score
from sklearn.metrics import roc_curve
from sklearn.metrics import precision_recall_curve, average_precision_score, auc
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import cross_val_predict
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score, f1_score
from sklearn.model_selection import GridSearchCV, ShuffleSplit
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import SGDClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
from sklearn import model_selection, preprocessing
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score, GridSearchCV, RandomizedSearchCV, KFold, cross_val_predict, StratifiedKFold, train_test_split, learning_curve, ShuffleSplit
from sklearn.metrics import mean_squared_error, accuracy_score, mean_absolute_error
from sklearn.preprocessing import RobustScaler, StandardScaler, LabelEncoder, MinMaxScaler, OneHotEncoder, LabelBinarizer
from pandas.plotting import scatter_matrix
from sklearn import preprocessing
from sklearn.tree import DecisionTreeRegressor
from sklearn.model_selection import StratifiedShuffleSplit
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
#get_ipython().magic(u'matplotlib inline')
plt.style.use('ggplot')


#from sklearn.cross_validation import KFold, cross_val_score
#from sklearn.utils.fixes import signature

data = pd.read_csv('database.csv')
data.sample(frac=1)
y = data['y']
XNorm = data.drop('y', axis=1)

f = open('model.pkl', 'rb')
model = pickle.load(f)

accuracy_per_batch = []
for i in np.arange(500, len(XNorm), 500):
    y1 = model.predict(XNorm[:i])
    acc = accuracy_score(y[:i], y1)
    accuracy_per_batch.append(acc)

prediction = model.predict(XNorm)
conf_mx = confusion_matrix(y, prediction)


def plot_confusion_matrix(cm, target_names, title='Confusion Matrix', cmap=None,
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
    plt.savefig('static/images/conmat.png')


def plot_confusion():
    plot_confusion_matrix(conf_mx,
                          normalize=False,
                          target_names=[0, 1, 2, 3],
                          title="Confusion Matrix")


batches = np.arange(500, len(XNorm), 500)


def save_condrft():
    plt.figure(figsize=(20, 10))
    plt.plot(batches, accuracy_per_batch)
    plt.xlabel("Batches")
    plt.ylabel("Accuracy")
    plt.savefig('static/images/cd.png')


# plot_confusion()
# save_condrft()
