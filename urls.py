from django.conf.urls import patterns, include, url                             
  
from django.contrib import admin                                                
admin.autodiscover()                                                            
  
urlpatterns = [                                                      
	url(r'^$', include(qa.views.test)),
	url(r'^login/$', include(qa.views.test)),
	url(r'^signup/$', include(qa.views.test)),
	url(r'^question/\d+/$', include(qa.views.test)),
	url(r'^ask/$', include(qa.views.test)),
	url(r'^popular/$', include(qa.views.test)),
	url(r'^new/$', include(qa.views.test)),
]