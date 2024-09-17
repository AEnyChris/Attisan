from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def index(response):
    return HttpResponse("""You are in the Home page for Attisan\n\
    Site under construction. :)""")
