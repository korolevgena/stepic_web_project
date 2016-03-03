#1from cgi import parse_qs
import urlparse

def hello(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
	response_body = "\r\n".join(environ['QUERY_STRING'].split("&")) 
	return [response_body]