from django.contrib import admin
from django.urls import path
from backend import views
urlpatterns = [
#  path("",views.index,name='home'),
    path("",views.home,name='home'),
    path("home",views.home,name='home'),
    path("login.html",views.login,name='login'),
    path("about",views.about,name='about'),
    path("developer_login",views.developer_login,name="developer_login"),
    path("doctor_login",views.doctor_login,name="doctor_login"),
    path("doc_register",views.doctor_signup_page,name="doctor_signup_page"),
    path("doc_signup",views.doctor_signup,name="doctor_signup"),
    path("predict",views.predict,name="graph"),
    path("contact_developer",views.contact_dev,name="contact developer"),
    path("input stream",views.predict,name="update input stream"),
    path("updateinput",views.updateinput)
]