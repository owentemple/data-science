# -*- coding: utf-8 -*-

# import libraries
import urllib2
from bs4 import BeautifulSoup

import csv
from datetime import datetime

# specify the url
quote_page = 'http://www.ted.com/talks/view/id/21/transcript?language=en'

# query the website and return the html to the variable ‘page’
page = urllib2.urlopen(quote_page)



# parse the html using beautiful soap and store in variable `soup`
soup = BeautifulSoup(page, 'html.parser')

# Take out the <div> of name and get its value
transcript_box = soup.find('div', attrs={'class': 'talk-article__body talk-transcript__body'})

name_box = soup.find('h4', attrs={'class': 'h12 talk-link__speaker'})

title_box = soup.find('h4', attrs={'class': 'h9 m5'})

ted_id = quote_page.split("/")[6]
ted_id = ted_id.strip() # strip() is used to remove starting and trailing
print ted_id

name = name_box.text.strip() # strip() is used to remove starting and trailing
#adjust for non-ACSII characters
name = name.encode('utf-8').decode('ascii', 'ignore')
print name


title = title_box.text.strip() # strip() is used to remove starting and trailing
#adjust for non-ACSII characters
title = title.encode('utf-8').decode('ascii', 'ignore')
print title


transcript = transcript_box.text.strip() # strip() is used to remove starting and trailing
#adjust for non-ACSII characters
transcript = transcript.encode('utf-8').decode('ascii', 'ignore')
print transcript



# open a csv file with append, so old data will not be erased
with open('index.csv', 'a') as csv_file:
  writer = csv.writer(csv_file)
  writer.writerow([ted_id, name, title, transcript, datetime.now()])

