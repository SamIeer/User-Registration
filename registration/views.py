from django.shortcuts import render, redirect
from .forms import Registerform
from django.contrib import messages
from django.contrib.auth.decorators import login_required

def register(request):
    if request.method == 'POST':
        form = Registerform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Registration successful! You can now log in.")
            return redirect('login')
    else:
        form = Registerform()
    return render(request, 'registration/register.html', {'form': form})

@login_required
def home(request):
    return render(request, 'home.html')