from bottle import request, route, run, template
from pyswip import Prolog
import json
prolog = Prolog()
prolog.consult("ArbEstFam.pl")

@route('/agregarfamilia', method='POST')
def agregarfamilia():
	data = request.json
	for d in data["padres"]:
		prolog.assertz('padres("'+d[0]+'","'+d[1]+'")')
	return data

@route('/Tio', method='POST')
def tio():
	data = request.json
	for d in data["es_tio"]:
		print(d[0])
		print(d[1])
		tt = prolog.query('tios("'+d[0]+'","'+d[1]+'")')
		T = list(tt)
	if T :
		return {"Es Tio" : T[1]} 
	else: 
		return{"No es Tio" : T} 


@route('/Primo', method='POST')
def primos():
	data = request.json

	for d in data["es_primo"]:
		print(d[0])
		print(d[1])
		pp = prolog.query('primos("'+d[0]+'","'+d[1]+'")')
		P = list(pp)
	if P :
		print(P[0])
		return {"Son Primos" : P[0]} 
	else: 
		return{"No son primos" : P} 



run(host='localhost',port=9091)