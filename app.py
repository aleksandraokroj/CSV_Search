import os
import io
import sys
import csv
import json
import numpy as np
import pandas as pd
from flask import Flask
from flask import request
from flask import render_template, redirect, url_for, request
app = Flask(__name__) 
import xml.etree.ElementTree as etree
from lxml import etree as ElementTree

@app.route("/")
def main():
    return render_template('index.html')

@app.route('/search', methods=['GET', 'POST'] )
def search():
    if request.method=='POST':
        search =request.form
        searchPost=str(search)
        newSearchPost=searchPost.replace("ImmutableMultiDict([(\'sel\', \'","")
        global finalSearchPost
        finalSearchPost=newSearchPost.replace("\')])","")
        #print(finalSearchPost)
        return render_template("search.html",search = search)
        
@app.route('/result', methods=['GET', 'POST'] )
def result():
    tree = ElementTree.parse('master.xml') 
    root = tree.getroot() 
    def show(xslDoc, txtDoc, xhtmlDoc):
        dom = ElementTree.parse('master.xml')
        xslt = ElementTree.parse(xslDoc)
        transform = ElementTree.XSLT(xslt)
        newdom = transform(dom)
        result = str(ElementTree.tostring(newdom, pretty_print=True))
        os.chdir("templates")
        f=open(txtDoc, 'w')
        f.write(result)
        f.close()
        os.chdir('..')
        os.chdir("templates") 
        with open (txtDoc) as badResult:
            lines = badResult.readlines()
        lines=[item.replace('\\n', "") for item in lines]
        lines=[item.replace('b\'', "") for item in lines]
        with open (txtDoc, 'w') as cleanResult:
            cleanResult.writelines(lines)
        with open (xhtmlDoc, 'w') as finalResult: 
            finalResult.writelines(lines)
        os.chdir("..")
        
    def change(xmlVar,newVar):
        for xmlVar in root.iter(xmlVar):
            xmlVar.text=str(newVar)
        tree.write('master.xml')
        
    if request.method=='POST' and finalSearchPost=="Dane podstawowe": 
        appName=str(request.form)
        newAppName=appName.replace("ImmutableMultiDict([(\'appNameText\', \'","")
        finalAppName=newAppName.replace("\')])","")
        wordsAppName=finalAppName.split(" ")
        number = len(wordsAppName)

        #zmieniamy nazwę aplikacji 
        change('appName',finalAppName)
        
        appReader = pd.read_csv('googleplaystore.csv', sep=',', header=0)
        string=str(appReader[appReader["App"]==finalAppName])
        list(string)
        s=list(dict.fromkeys(list(string.split(" "))))

        #zmieniamy kategorię
        newCategory=s[17+number]
        for app in root.iter('app'):
            app.set('category',str(newCategory))
        tree.write('master.xml')

        #zmieniamy rating
        newRating=s[17+number+1]
        change('rating', newRating)

        #zmieniamy reviews
        newAppReviews=s[17+number+2]
        change('appReviews', newAppReviews)

        #zmieniamy size
        newSize=s[17+number+3]
        change('size', newSize)

        #zmieniamy installs
        newInstalls=s[17+number+4]
        change('installs', newInstalls)

        #zmieniamy type
        newType=s[17+number+5]
        change('typeOfApp', newType)

        #zmieniamy price
        newPrice=s[17+number+6]
        change('price', newPrice)

        #zmieniamy dla kogo
        newContentRating=s[17+number+7]
        change('contentRating', newContentRating)

        #zmieniamy gatunek
        newGenre=s[17+number+8]
        change('genre', newGenre)

        #zmieniamy lastUpdated 
        newLastUpdated1=s[17+number+9]
        newLastUpdated2=s[17+number+10]
        newLastUpdated3=s[17+number+11]
        for lastUpdated in root.iter('lastUpdated'): 
            lastUpdated.text = str(newLastUpdated1) + " " + str(newLastUpdated2) + " " + str(newLastUpdated3)
        tree.write('master.xml')

        #zmieniamy current Ver 
        newCurrentVer=s[17+number+12]
        change('current', newCurrentVer)

        #zmieniamy android ver 
        newAndroidVer=s[17+number+13]
        change('android', newAndroidVer)

        #zmieniamy Ilość aplikacji w bazie 
        newTestedApplications = str(appReader["App"].count())
        change('testedApplications', newTestedApplications)

        #zmieniamy Najczęstsza kategoria 
        detailedCategory = list(appReader["Category"].describe())
        newCategoryTop = detailedCategory[2]
        change('categoryTop', newCategoryTop)

        #zmieniamy Ilość kategorii
        newCategoryUnique = detailedCategory[1]
        change('categoryUnique', newCategoryUnique)

        #zmieniamy średnią ocenę
        detailedRating = list(appReader["Rating"].describe())
        newRatingGen = round(detailedRating[1],2)
        change('ratingGen', newRatingGen)

        #zmieniamy najwięcej instalacjii
        detailedInstalls =list (appReader["Installs"].describe())
        newInstallsGen = detailedInstalls[2]
        change('installsGen', newInstallsGen)

        #zmieniamy najczęstszy typ
        detailedType = list(appReader["Type"].describe())
        newTypeTop = detailedType[2]
        change('typeTop', newTypeTop)

        #zmieniamy ilość typów
        newTypeUnique = detailedType[1]
        change('typeUnique', newTypeUnique)

        #zmieniamy najczęstszy target
        detailedContentRating=list(appReader["Content Rating"].describe())
        newContentRatingTop = detailedContentRating[2]
        change('contentRatingTop', newContentRatingTop)

        #zmieniamy ilość targetów
        newContentRatingUnique = detailedContentRating[1]
        change('contentRatingUnique', newContentRatingUnique)

        #zmieniamy najczęstszą wersję androida
        detailedAndroidVer = list(appReader["Android Ver"].describe())
        newAndroidVerGen = str(detailedAndroidVer[2]) 
        change('androidVerGen', newAndroidVerGen) 

        show('master1.xsl', 'result.txt', 'result1.xhtml')  
        return render_template('result1.xhtml')    

    elif (request.method=='POST' and finalSearchPost=="Opinie użytkowników"):

        appName=str(request.form)
        newAppName=appName.replace("ImmutableMultiDict([(\'appNameText\', \'","")
        finalAppName=newAppName.replace("\')])","")

        tree = ElementTree.parse('master.xml') 
        root = tree.getroot() 
        #zmieniamy nazwę aplikacji 
        for reviewdApp in root.iter('reviewdApp'):
            reviewdApp.set('name',str(finalAppName))
        tree.write('master.xml')

        reviewsReader = pd.read_csv('googleplaystore_user_reviews.csv', sep=',', header=0)
        string=str(reviewsReader[reviewsReader["App"]==finalAppName])
        os.chdir("templates")
        r=open('reviews.txt', 'w')
        r.write((string))
        os.chdir('..')
        list(string.split(" "))
        num=(reviewsReader[reviewsReader["App"]==finalAppName].count())
        newNum=list(num)
        #zmieniamy ilość recenzji danej apki
        newAllReviews=num[1]
        # for allReviews in root.iter('allReviews'):
        #      allReviews.text = str(newAllReviews)
        # tree.write('master.xml')
        change('allReviews', newAllReviews)

        #recenzje 
        rev=list(reviewsReader["Translated_Review"])
        filter_list=[finalAppName]
        indexList=(list(reviewsReader[reviewsReader.App.isin(filter_list)].index))
        length=len(indexList)
        indexList.append(indexList[length-1]+1)
        indexList.append(indexList[length-1]+2)
        
        #top3
        revIndexList=indexList[2:5]
        
        new1=rev[revIndexList[0]]
        new2=rev[revIndexList[1]]
        new3=rev[revIndexList[2]]

        change('newReview1', new1)
        change('newReview2', new2)
        change('newReview3', new3)

        #bottom3 
        bottomRevIndexList=indexList[-3:]
        old1=rev[bottomRevIndexList[0]]
        old2=rev[bottomRevIndexList[1]]
        old3=rev[bottomRevIndexList[2]]

        change('oldReview1', old1)
        change('oldReview2', old2)
        change('oldReview3', old3)

        show('master2.xsl', 'result2.txt', 'result2.xhtml')
        return render_template('result2.xhtml')

@app.errorhandler(500)
def internal_error(error):
    return render_template('error.html', error=error)

if __name__ == "__main__":
    app.run()