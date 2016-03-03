#1from cgi import parse_qs
import urlparse

def hello(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
	# Returns a dictionary containing lists as values
	#1 args = parse_qs(environ['QUERY_STRING'])
	#1x = args.get('x', [''])[0] # Returns the X value.
	#1y = args.get('y', [''])[0] # Returns the Y value.
	#1response_body = 'x=' + x + 'y=' + y
    
query='id=1&address=something'
mydict=urlparse.parse_qs(query)
	
	return [response_body]