from django.shortcuts import render,HttpResponse
from backend.models import developer
from backend.models import doctor
from django.contrib import messages
from datetime import datetime
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password,check_password
from django.contrib.messages import constants as messages
# Create your views here.
def about(request):
    return render(request,'about page.html')

def home(request):
    return render(request,'home.html')

def login(request):
    return render(request,'login.html')

def developer_login(request):
    if request.method == 'POST' :
        user=request.POST['username']
        psw=request.POST['password']
        auth=authenticate(username=user,password=psw)
        if auth is not None:
            return render(request,'developer.html')
        else:
            return render(request,'login.html')
            
            
    else :
        return HttpResponse("404 - not found")

def doctor_login(request):
    if request.method == 'POST':
        user=request.POST['username']
        psw=request.POST['password']
        auth=doctor.objects.get(user_name=user)        
        if auth is not None and check_password(psw,auth.password):
            return render(request,'doc_page.html')
        else :

            return render(request,'login.html')
    else :
        return HttpResponse("404 - not found")

def doctor_signup(request):
    if request.method=='POST':
        name=request.POST['fname']+request.POST['lname']
        position=request.POST['position']
        age=request.POST['age']
        experience = request.POST.get('experience', False)
        repsw=request.POST['re_password']
        psw=request.POST['password']
        user_name=request.POST['pseudo']
        user=doctor(position=position,name=name,user_name=user_name,password=make_password(psw),age=age,experience=experience)
        user.save()
        return render(request,'login.html')
    else:
        return HttpResponse("404 - not found")
def doctor_signup_page(request):
    return render(request,'doc_signup.html')