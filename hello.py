from cgi import parse_qs

def hello(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
	# Returns a dictionary containing lists as values
	args = parse_qs(environ['QUERY_STRING'])
	x = args.get('x', [''])[0] # Returns the X value.
	y = args.get('y', [''])[0] # Returns the Y value.
	response_body = 'x=' + x + 'y=' + y
    return [response_body]