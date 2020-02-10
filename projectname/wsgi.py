import os

from django.core.wsgi import get_wsgi_application

dj_project_name = os.getenv('global_project_name')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', dj_project_name+'.settings')

application = get_wsgi_application()
