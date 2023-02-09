##Bayesian Analysis

##Project on Pima Indian Diabetes
##Group: Nidhi Vadnere and Jahnavi Bonagiri
##Professor Kevin Knuth

#Imports Needed
import inline as inline
import matplotlib
import pandas as pd
import numpy as np
import seaborn as sns
sns.set(color_codes=True)
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from imblearn.over_sampling import SMOTE
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn import metrics
from sklearn.metrics import classification_report

#Read Data
dat = pd.read_csv(r"C:\Users\Jahnavi Bonagiri\PycharmProjects\pima-indians-diabetes.csv")
print(dat.head(10))
#Attribute Distribution Plots
dat.shape
dat.columns
dat.describe().T
sns.countplot(x="Class", data=dat)
dat.hist(figsize=(15,10))
sns.pairplot(dat, hue="Class")
cor=dat.corr()
cor
plt.show()

#Replaces the 0's to NaN
data = dat[['Plasma','Pressure','Skin','Test','Bmi','Pedigree']]=dat[['Plasma','Pressure','Skin','Test','Bmi','Pedigree']].replace(0,np.nan)
#Replaces NaN to Median
data.isnull().sum()[['Plasma','Pressure','Skin','Test','Bmi','Pedigree']]
dat['Plasma'].fillna(dat['Plasma'].median(),inplace=True)
dat['Pressure'].fillna(dat['Pressure'].median(),inplace=True)
dat['Skin'].fillna(dat['Skin'].median(),inplace=True)
dat['Test'].fillna(dat['Test'].median(),inplace=True)
dat['Bmi'].fillna(dat['Bmi'].median(),inplace=True)
#Prints the New table
print(dat.head())
X= dat.drop("Class", axis=1)
Y= dat["Class"]
#Split X and Y into training and testing set in 70:30 ratio
XTrain,XTest,YTrain,YTest=train_test_split(X,Y,test_size=0.3,random_state=1)
columns=XTrain.columns
#Scale Data
scaler=StandardScaler()
scaler.fit(XTrain)
XTrain = scaler.transform(XTrain)
XTest = scaler.transform(XTest)
sampling=SMOTE(random_state=0)
dataX,dataY=sampling.fit_resample(XTrain,YTrain)
dataX=pd.DataFrame(data=dataX,columns=columns)
dataY=pd.DataFrame(dataY,columns=['Class'])
#Print the oversampled data
print('Length of oversampled data is: ',len(dataX))
#Naive Bayes Model
#Use Gaussian Fucntion to see accuracy and classification metrics
modG=GaussianNB()
modG.fit(dataX,dataY)
pred = modG.predict(XTest)
score = modG.score(XTest, YTest)
print('Model score :',score)
print('Confusion Matrix :\n', metrics.confusion_matrix(YTest,pred))
print(classification_report(YTest,pred))
print('Accuracy :',metrics.accuracy_score(YTest,pred))
print('Precision :',metrics.precision_score(YTest,pred))
print('Recall :',metrics.recall_score(YTest,pred))
print('F-score :',metrics.f1_score(YTest,pred))
