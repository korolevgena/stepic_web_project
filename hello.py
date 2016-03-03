def hello(environ, start_response):
	start_response('200 OK', [('Content-Type', 'text/plain')])
	body = "\r\n".join(environ['QUERY_STRING'].split("&")) 
	return [ body ]