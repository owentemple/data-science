# -*- coding: utf-8 -*-

# import libraries
import urllib2
from bs4 import BeautifulSoup

import csv
from datetime import datetime
import time

# specify the url
quote_page = ['http://www.ted.com/talks/view/id/1/transcript?language=en','http://www.ted.com/talks/view/id/2780/transcript?language=en','http://www.ted.com/talks/view/id/2781/transcript?language=en']



# for loop
data = []
for pg in quote_page:
 # query the website and return the html to the variable ‘page’
  page = urllib2.urlopen(pg)
# parse the html using beautiful soap and store in variable `soup`
  soup = BeautifulSoup(page, 'html.parser')

  # Take out the <div> of transcript and get its value
  transcript_box = soup.find('div', attrs={'class': 'talk-article__body talk-transcript__body'})
  name_box = soup.find('h4', attrs={'class': 'h12 talk-link__speaker'})
  title_box = soup.find('h4', attrs={'class': 'h9 m5'})

  ted_id = pg.split("/")[6]
  ted_id = ted_id.strip()

  name = name_box.text.strip()
  name = name.encode('utf-8').decode('ascii', 'ignore')

  title = title_box.text.strip()
  title = title.encode('utf-8').decode('ascii', 'ignore')

  transcript = transcript_box.text.strip()
  transcript = transcript.encode('utf-8').decode('ascii', 'ignore')

  # save the data in tuple
  data.append((ted_id, name, title, transcript))
  time.sleep(10)



# open a csv file with append, so old data will not be erased
with open('index.csv', 'a') as csv_file:
  writer = csv.writer(csv_file)
  # The for loop
  for ted_id, name, title, transcript in data:
    writer.writerow([ted_id, name, title, transcript, datetime.now()])







