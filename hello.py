def hello(environ, start_response):
	status = '200 OK'
	start_response('200 OK', [('Content-Type', 'text/plain')])
	body = "\r\n".join(environ['QUERY_STRING'].split("&")) 
	return [ body ]