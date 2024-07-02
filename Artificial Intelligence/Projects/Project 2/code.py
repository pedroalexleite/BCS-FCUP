from numpy import NAN

import pandas as pd

from sklearn.preprocessing import LabelEncoder

from sklearn import tree

from sklearn.model_selection import train_test_split

from sklearn.naive_bayes import GaussianNB


df = pd.read_csv ('speedDating_trab.csv')
df = df.dropna()

def average_age():
    Average_age = df['age'].mean()

    print ("A média de idades dos participantes é: " + str(Average_age))

def date():
    print(df['date'].value_counts(normalize = True))

def goal():
    print(df['goal'].value_counts(normalize = True))

def go_out():
    print(df['go_out'].value_counts(normalize = True))

def num_match():
    matches = len(df.loc[df['match'] == 1])

    print("Houve no total " + str(matches) + " matches")

def match_corr():
    average_corr_match = df.loc[df['match'] == 1, 'int_corr'].mean()
    average_corr_nomatch = df.loc[df['match'] == 0, 'int_corr'].mean()

    print("A média da correlação para todos os participantes é: "+ str(df['int_corr'].mean()) + ", no entanto, para participantes que deram match é: " + str(average_corr_match))
    print("A média da correlação dos participantes que não deram match é:" + str(average_corr_nomatch))

def match_age():
    average_age_match = df.loc[df['match'] == 1, 'age'].mean()

    print("A média das idades das pessoas que tiveram match é: " + str(average_age_match))


def goal_match():
    x = df[df['match'] == 1].goal.mode()

    print(x)

def length_match():
    x = df[df['match'] == 1].length.mode()

    print(x)

def nancounter():
    print(df.isna().sum())

def nanreplace():
    df['age'] = df['age'].fillna(int((df['age'].mean())))
    df['age_o'] = df['age_o'].fillna(int((df['age_o'].mean())))
    df['goal'] = df['goal'].fillna((df['goal'].mode()[0]))
    df['go_out'] = df['go_out'].fillna((df['go_out'].mode()[0]))
    df['date'] = df['date'].fillna(df['date'].mode()[0])
    df['int_corr'] = df['int_corr'].fillna((df['int_corr'].mean()))
    df['length'] = df['length'].fillna((df['length'].mode()[0]))
    df['met'] = df['met'].fillna((df['met'].mode()[0]))
    df['like'] = df['like'].fillna((df['like'].mode()[0]))
    df['prob'] = df['prob'].fillna((df['prob'].mode()[0]))

def id3():
    inputs = df.drop('match',axis = 'columns')
    target = df['match']
    le_goal = LabelEncoder()
    le_go_out = LabelEncoder()
    le_length = LabelEncoder()
    le_met = LabelEncoder()
    inputs['goal_n'] = le_goal.fit_transform(inputs['goal'])
    inputs['go_out_n'] = le_go_out.fit_transform(inputs['go_out'])
    inputs['length_n'] = le_length.fit_transform(inputs['length'])
    inputs['met_n'] = le_met.fit_transform(inputs['met'])
    inputs_n = inputs.drop(['goal','go_out','length','met'],axis='columns')
    X = inputs_n[['age','age_o','goal_n','date','go_out_n','int_corr','length_n','met_n','like','prob']]
    Y = df['match']
    X_train,X_test,Y_train,Y_test = train_test_split(X,Y,test_size = 0.2)
    clf = tree.DecisionTreeClassifier()
    clf.fit(X_train,Y_train)
    
    print(clf.predict(X_test))
    print(Y_test)
    print('O score do modelo é: ' + str(clf.score(X_test,Y_test)))


def naive_bayes():
    target = df['match']
    inputs = df.drop('match',axis = 'columns')
    le_goal = LabelEncoder()
    le_go_out = LabelEncoder()
    le_length = LabelEncoder()
    le_met = LabelEncoder()
    inputs['goal_n'] = le_goal.fit_transform(inputs['goal'])
    inputs['go_out_n'] = le_go_out.fit_transform(inputs['go_out'])
    inputs['length_n'] = le_length.fit_transform(inputs['length'])
    inputs['met_n'] = le_met.fit_transform(inputs['met'])
    inputs_n = inputs.drop(['goal','go_out','length','met'],axis='columns')
    X = inputs_n[['age','age_o','goal_n','date','go_out_n','int_corr','length_n','met_n','like','prob']]
    Y = df['match']
    X_train,X_test,Y_train,Y_test = train_test_split(X,Y,test_size = 0.2)
    clf = GaussianNB()
    clf.fit(X_train,Y_train)

    print(clf.predict(X_test))
    print(Y_test)
    print('O score do modelo é: ' + str(clf.score(X_test,Y_test)))

#nanreplace()
#length_match()
average_age()
#date()
#goal()
#go_out()
#num_match()
#match_corr()
#match_age()
#goal_match()
#length_match()
#nancounter()
#id3()
#naive_bayes()
