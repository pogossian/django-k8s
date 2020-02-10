from __future__ import absolute_import, unicode_literals
import os
from celery import Celery

dj_project_name = os.getenv('global_project_name')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', dj_project_name+'.settings')

app = Celery(dj_project_name)
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
