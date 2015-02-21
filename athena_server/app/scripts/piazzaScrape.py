from piazza_api import Piazza
import json

p = Piazza()
p.user_login('thomklau@stanford.edu', 'thomaslau');

f = open('profile.txt','w')
json.dump(p.get_user_profile(), f);